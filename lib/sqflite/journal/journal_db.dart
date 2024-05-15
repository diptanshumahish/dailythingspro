import 'package:dailythingspro/sqflite/common.dart';
import 'package:dailythingspro/sqflite/models/journal_model.dart';
import 'package:sqflite/sqflite.dart';

class JournalDB {
  final tableName = 'journal';
  final dbName = "journal.db";

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
}
