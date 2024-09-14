import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // For constructing database paths

Future<Database> initializeDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'app_database.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE wellness_vouchers(id INTEGER PRIMARY KEY, name TEXT, price REAL, merchantName TEXT)',
      );
    },
    version: 1,
  );
}
