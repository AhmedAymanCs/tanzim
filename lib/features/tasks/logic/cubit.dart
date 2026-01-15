import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/features/tasks/data/data_source/tasks_local_database.dart';
import 'package:tanzim/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:tanzim/features/tasks/logic/states.dart';

class TasksCubit extends Cubit<TasksStates> {
  TasksCubit() : super(TasksInitialState());

  static TasksCubit get(context) => BlocProvider.of(context);

  int activeTasks = 10;
  int completedTasks = 5;
  int activeButton = 0;
  bool isDone = false;
  final TasksRepository repository = TasksRepository(
    TasksLocalDatabaseSource(),
  );
  void changeActiveButton(int index) {
    activeButton = index;
    emit(ChangingActiveButtonState());
  } //for filtering tasks

  void changeStateOfTask() {
    isDone = !isDone;
    emit(ChangingStateOfTaskState());
  }

  //get all tasks form DB
  Future<void> getTasksFromDB() async {
    emit(TasksLoadingState());
    try {
      final tasks = await repository.getTasks();
      emit(TasksLoadedState(tasks: tasks));
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  //insert Task into DB
  Future<void> insertTaskIntoDB(Map<String, dynamic> task) async {
    emit(TasksLoadingState());
    try {
      await repository.insertTask(task);
      await getTasksFromDB();
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  //delete Task from DB
  Future<void> deleteTaskFromDB(int id) async {
    emit(TasksLoadingState());
    try {
      await repository.deleteTask(id);
      await getTasksFromDB();
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }
}
