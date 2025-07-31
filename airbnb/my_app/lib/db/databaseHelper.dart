import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databasehelper {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'airbnb.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {},
    );
    return _database!;
  }
}
