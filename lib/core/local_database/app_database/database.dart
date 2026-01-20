import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalAppDB {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE Tasks
           (id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT, 
            subTitle TEXT,
            period TEXT,
            date TEXT,
             hour INTEGER,
             minutes INTEGER,
             isDone INTEGER,
             priority INTEGER)''');
      },
    );
  }
}
