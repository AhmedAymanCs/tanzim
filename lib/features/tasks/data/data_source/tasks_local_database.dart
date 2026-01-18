import 'package:tanzim/core/local_database/app_database/database.dart';

class TasksLocalDatabaseSource {
  //get tasks
  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final db = await LocalAppDB.database;
    return db.query('Tasks');
  }

  //insert tasks
  Future<void> insertTask(Map<String, dynamic> value) async {
    final db = await LocalAppDB.database;
    await db.insert('Tasks', value);
  }

  //delete tasks
  Future<void> deleteTask(int id) async {
    final db = await LocalAppDB.database;
    await db.delete('Tasks', where: 'id = ?', whereArgs: [id]);
  }

  //update tasks
  Future<int> updateTask(int id, int value) async {
    final db = await LocalAppDB.database;
    return await db.update(
      "Tasks",
      {"isDone": value},
      where: "id= ?",
      whereArgs: [id],
    );
  }
}
