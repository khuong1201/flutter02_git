import 'package:my_app/db/databaseHelper.dart';

Databasehelper dbHelper = Databasehelper();

Future<void> createUserTable() async {
  final db = await dbHelper.database;
  final result = await db.rawQuery('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE
    )
  ''');
  print(result);
}