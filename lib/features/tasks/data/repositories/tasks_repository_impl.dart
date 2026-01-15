import 'package:tanzim/features/tasks/data/data_source/tasks_local_database.dart';

class TasksRepository {
  final TasksLocalDatabaseSource local;

  TasksRepository(this.local);

  //get all tasks
  Future<List<Map<String, dynamic>>> getTasks() async {
    return await local.getAllTasks();
  }

  //insert task
  Future<void> insertTask(Map<String, dynamic> value) async {
    await local.insertTask(value);
  }

  //delete task
  Future<void> deleteTask(int id) async {
    local.deleteTask(id);
  }
}
