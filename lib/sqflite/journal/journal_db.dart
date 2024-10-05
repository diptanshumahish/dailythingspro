import 'dart:io';
import 'package:dailythingspro/sqflite/common.dart';
import 'package:dailythingspro/sqflite/models/journal_model.dart';
import 'package:dailythingspro/utils/notif_service.dart';
import 'package:dailythingspro/utils/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class JournalDB {
  final tableName = 'journal';
  final dbName = "journal.db";

  Future<void> backupAndShareDatabase() async {
    try {
      String dbPath = await getDatabasesPath();
      String journalDBPath = join(dbPath, 'journal.db');

      Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir != null) {
        String backupPath = join(externalDir.path, 'journal_backup.db');
        File originalDbFile = File(journalDBPath);
        await originalDbFile.copy(backupPath);
        await Share.shareXFiles([XFile(backupPath)],
            text: 'Here is my journal backup file.');
        DTNotificationService().showNotification(
            body:
                "Share your backup file to some storage source, such as a drive or otherwise store it locally, you can use this for backup",
            title: "Preserve your backup🎉");
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print('Error while backing up database: $e');
      }
    }
  }

  Future<void> restoreDatabase(String backupPath) async {
    try {
      String dbPath = await getDatabasesPath();
      String journalDBPath = join(dbPath, 'journal.db');
      await closeDatabase();
      File backupDbFile = File(backupPath);
      File journalDbFile = File(journalDBPath);

      await journalDbFile.delete(); 
      await backupDbFile.copy(
          journalDBPath); 

      await DatabaseService().getDatabase(dbName);

      ToastShow.returnToast('Database restored from: $backupPath');
    } catch (e) {
      ToastShow.returnToast('Error while restoring database: $e');
    }
  }

  Future<void> chooseAndRestoreDatabase() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        String backupFilePath = result.files.single.path!; // Get the file path
        await restoreDatabase(backupFilePath);
        ToastShow.returnToast('Database restored successfully from: $backupFilePath');
      } else {
        ToastShow.returnToast('No file selected.');
      }
    } catch (e) {
      ToastShow.returnToast('Error during file selection or restoration: $e');
    }
  }

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "dayKey" TEXT NOT NULL,
      "title" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "createdTime" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as integer )),
      "mood" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> createJournal(
      {required String title,
      required String dayKey,
      required String mood,
      required String description}) async {
    final database = await DatabaseService().getDatabase(dbName);
    return await database.rawInsert('''
    INSERT INTO $tableName (dayKey,title,description,createdTime,mood) VALUES (?,?,?,?,?)
''', [dayKey, title, description, DateTime.now().millisecondsSinceEpoch, mood]);
  }

  Future<List<JournalEntry>> fetchJournal(String dayKey) async {
    final database = await DatabaseService().getDatabase(dbName);
    final journals = await database.rawQuery('''
    SELECT * FROM $tableName WHERE dayKey = ?
  ''', [dayKey]);
    return journals.map((j) => JournalEntry.fromJson(j)).toList();
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().getDatabase(dbName);
    final numberOfDeleted = await database.rawDelete('''
        DELETE FROM $tableName WHERE id = ?
''', [id]);

    return numberOfDeleted;
  }

  Future<int> deleteAll() async {
    final database = await DatabaseService().getDatabase(dbName);
    final numberOfDeleted =
        await database.rawDelete('''DELETE FROM $tableName''');
    return numberOfDeleted;
  }

  // Function to close the database before restoring
  Future<void> closeDatabase() async {
    Database? database = await DatabaseService().getDatabase(dbName);
    await database.close();
    if (kDebugMode) {
      print("Database closed.");
    }
  }
}
