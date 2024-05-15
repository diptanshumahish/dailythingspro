import 'package:shared_preferences/shared_preferences.dart';

Future<void> addToLocalStorage(String key, String value) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  await storage.setString(key, value);
}

Future<String?> getDataFromLocalStorage(String key) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? data = storage.getString(key);
  return data;
}
