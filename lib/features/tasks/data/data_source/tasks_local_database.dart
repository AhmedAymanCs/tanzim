import 'package:tanzim/core/local_database/app_database/database.dart';

class TasksLocalDatabaseSource {
  //get all tasks
  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final db = await LocalAppDB.database;
    return db.query('Tasks');
  }

  //get Done tasks
  Future<List<Map<String, dynamic>>> getDoneTasks() async {
    final db = await LocalAppDB.database;
    return db.query('Tasks', where: "isDone = ?", whereArgs: [1]);
  }

  //get un compeleted tasks
  Future<List<Map<String, dynamic>>> getUnDoneTasks() async {
    final db = await LocalAppDB.database;
    return db.query('Tasks', where: "isDone = ?", whereArgs: [0]);
  }

  //insert tasks
  Future<int> insertTask(Map<String, dynamic> value) async {
    final db = await LocalAppDB.database;
    return db.insert('Tasks', value);
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
