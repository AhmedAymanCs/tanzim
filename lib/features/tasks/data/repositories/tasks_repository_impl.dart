import 'package:tanzim/features/tasks/data/data_source/tasks_local_database.dart';

class TasksRepository {
  final TasksLocalDatabaseSource local;

  TasksRepository(this.local);

  //get all tasks
  Future<List<Map<String, dynamic>>> getTasks() async {
    return await local.getAllTasks();
  }

  //get Done tasks
  Future<List<Map<String, dynamic>>> getDoneTasks() async {
    return await local.getDoneTasks();
  }

  //get Un Done tasks
  Future<List<Map<String, dynamic>>> getUnDoneTasks() async {
    return await local.getUnDoneTasks();
  }

  //insert task
  Future<int> insertTask(Map<String, dynamic> value) async {
    return await local.insertTask(value);
  }

  //delete task
  Future<void> deleteTask(int id) async {
    await local.deleteTask(id);
  }

  Future<int> updateTasks(int id, int value) async {
    return await local.updateTask(id, value);
  }
}
