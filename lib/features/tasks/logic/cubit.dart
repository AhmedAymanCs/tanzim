import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/features/tasks/data/data_source/tasks_local_database.dart';
import 'package:tanzim/features/tasks/data/model/time_model.dart';
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
  final TasksRepository repository = TasksRepository(
    TasksLocalDatabaseSource(),
  );

  TimeModel currentTimeModel = const TimeModel(
    hour: '',
    minute: '',
    period: '',
  );
  void setTimeModel(TimeModel currnetTime) {
    currentTimeModel = currnetTime;
  }

  int activeTasks = 0;
  int completedTasks = 0;
  int activeButton = 0;

  void updateTime(TimeModel newTime) {
    currentTimeModel = newTime;
  }

  void changeActiveButton(int index) {
    activeButton = index;
  } //for filtering tasks

  void changeStateOfTask(int id, int isDone) {
    try {
      updateTask(id, isDone).then((_) {
        getTasksFromDB();
      });
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
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

  Color? getPriorityColor(int num, bool isDone) {
    if (isDone) {
      switch (num) {
        case 1:
          return ColorManager.red;
        case 2:
          return ColorManager.orange;
        case 3:
          return ColorManager.green;
      }
    }

    return ColorManager.lightGrey;
  }

  //get all tasks form DB
  Future<void> getTasksFromDB() async {
    emit(TasksLoadingState());
    try {
      final tasks = await repository.getTasks();
      countFilterdTasks(tasks);
      changeActiveButton(0);
      emit(TasksLoadedState(tasks: tasks));
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  void countFilterdTasks(List<Map<String, dynamic>> Tasks) {
    completedTasks = Tasks.where((task) => task['isDone'] == 1).length;
    activeTasks = Tasks.length - completedTasks;
  }

  Future<void> getCompleteTasksFromDB() async {
    emit(TasksLoadingState());
    try {
      final doneTasks = await repository.getDoneTasks();
      changeActiveButton(1);
      emit(DoneTasksLoadedState(tasks: doneTasks));
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  //get un completed Tasks
  Future<void> getUnCompleteTasksFromDB() async {
    emit(TasksLoadingState());
    try {
      final unDoneTasks = await repository.getUnDoneTasks();
      changeActiveButton(2);
      emit(UnDoneTasksLoadedState(tasks: unDoneTasks));
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

  //update Task
  Future<int> updateTask(int id, int value) async {
    return await repository.updateTasks(id, value);
  }
}
