import 'package:my_app/db/databaseHelper.dart';

Databasehelper dbHelper = Databasehelper();

Future<dynamic> getUsers() async {
  final db = await dbHelper.database;
  final result = await db.query("users");
  return result;
}

Future<dynamic> insertUser(user) async {
  final db = await dbHelper.database;
  return await db.insert('users', user);
}

Future<dynamic> deleteUser(id) async {
  final db = await dbHelper.database;
  final result = await db.delete(
    "users",
    where: 'id = ?',
    whereArgs: [id]
  );
  return result;
}

Future<dynamic> updateUser(user,id) async {
  final db = await dbHelper.database;
  final result = await db.update(
    "users",
    user,
    where: 'id = ?',
    whereArgs: [id]
  );
  return result;
}
