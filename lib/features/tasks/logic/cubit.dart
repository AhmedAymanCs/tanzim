import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/features/tasks/data/data_source/tasks_local_database.dart';
import 'package:tanzim/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:tanzim/features/tasks/logic/states.dart';
import 'package:tanzim/generated/l10n.dart';

class TasksCubit extends Cubit<TasksStates> {
  TasksCubit() : super(TasksInitialState());

  static TasksCubit get(context) => BlocProvider.of(context);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

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

  String getPriorityText(context, int num) {
    switch (num) {
      case 1:
        return S.of(context).high;
      case 2:
        return S.of(context).medium;
      case 3:
        return S.of(context).low;
    }
    return '';
  }

  Color? getPriorityColor(int num) {
    switch (num) {
      case 1:
        return ColorManager.red;
      case 2:
        return ColorManager.orange;
      case 3:
        return ColorManager.green;
    }
    return null;
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
