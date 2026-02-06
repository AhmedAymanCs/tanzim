import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tanzim/core/local_database/di/service_locator.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/service/notification_service.dart';
import 'package:tanzim/features/tasks/data/data_source/tasks_local_database.dart';
import 'package:tanzim/features/tasks/data/model/date_model.dart';
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
  TimeModel currentTimeModel = const TimeModel(hour: 0, minute: 0, period: '');

  DateModel currentDateModel = const DateModel(day: 0, month: 0, year: 0);

  int activeTasks = 0;
  int completedTasks = 0;
  int activeButton = 0;

  //submit create task
  Future<bool> submitCreateTask({
    required String timeErrorMsg,
    required String priorityErrorMsg,
    required int priority,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate() && priority != 0 && isSuitableTime()) {
      insertTaskIntoDB({
        "title": titleController.text,
        "subTitle": descriptionController.text,
        "hour": currentTimeModel.hour,
        "minutes": currentTimeModel.minute,
        "period": currentTimeModel.period,
        "date": dateController.text,
        "priority": priority,
        "isDone": 0,
      }).then((value) {
        clearTaskFormField();
      });
    } else if (priority == 0) {
      Fluttertoast.showToast(
        msg: priorityErrorMsg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorManager.orange,
      );
      return false;
    } else if (!isSuitableTime()) {
      Fluttertoast.showToast(
        msg: timeErrorMsg,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: ColorManager.red,
      );
      return false;
    }
    return true;
  }

  Future<bool> submitUpdateTask({
    required int id,
    required String timeErrorMsg,
    required String priorityErrorMsg,
    required int priority,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate() && isSuitableTime()) {
      await updataTask(
        timeErrorMsg: timeErrorMsg,
        priorityErrorMsg: priorityErrorMsg,
        priority: priority,
        id: id,
        formKey: formKey,
      );
    } else if (!isSuitableTime()) {
      Fluttertoast.showToast(
        msg: timeErrorMsg,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: ColorManager.red,
      );
      return false;
    }
    return true;
  }

  Future<bool> updataTask({
    required String timeErrorMsg,
    required String priorityErrorMsg,
    required int priority,
    required int id,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate() && priority != 0 && isSuitableTime()) {
      updateTaskIntoDB(id, {
        "title": titleController.text,
        "subTitle": descriptionController.text,
        "hour": currentTimeModel.hour,
        "minutes": currentTimeModel.minute,
        "period": currentTimeModel.period,
        "date": dateController.text,
        "priority": priority,
      }).then((value) {
        clearTaskFormField();
      });
    } else if (priority == 0) {
      Fluttertoast.showToast(
        msg: priorityErrorMsg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorManager.orange,
      );
      return false;
    } else if (!isSuitableTime()) {
      Fluttertoast.showToast(
        msg: timeErrorMsg,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: ColorManager.red,
      );
      return false;
    }
    return true;
  }

  bool isSuitableTime() {
    final DateTime now = DateTime.now();
    final pickedDateTime = DateTime(
      currentDateModel.year,
      currentDateModel.month,
      currentDateModel.day,
      currentTimeModel.period == "AM"
          ? currentTimeModel.hour
          : currentTimeModel.hour + 12,
      currentTimeModel.minute,
    );
    if (pickedDateTime.isAfter(now)) {
      return true;
    } else {
      return false;
    }
  } // check if the picked time is suitable (after current time)

  void fillDateModel(DateModel date) {
    currentDateModel = date;
  } //fill date model

  void fillTimeModel(TimeModel time) {
    currentTimeModel = time;
  } //fill time model

  void clearTaskFormField() {
    titleController.text = "";
    descriptionController.text = "";
    timeController.text = "";
    dateController.text = "";
  } //clear task form fields

  void changeActiveButton(int index) {
    activeButton = index;
  } //for filtering tasks

  void changeStateOfTask(int id, int isDone) {
    try {
      changeTaskStateTask(id, isDone).then((_) {
        getTasksFromDB();
      });
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  } //change task state

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
  } //get priority text

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
  } //get priority color

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
  } //count filtered tasks

  //get completed Tasks
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
      final int id = await repository.insertTask(task);
      await setNotificationService(
        id: id,
        title: task['title'],
        body: task['subTitle'],
        scheduledTime: DateTime(
          currentDateModel.year,
          currentDateModel.month,
          currentDateModel.day,
          currentTimeModel.period == 'AM'
              ? currentTimeModel.hour
              : currentTimeModel.hour + 12,
          currentTimeModel.minute,
        ),
      );
      await getTasksFromDB();
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  Future<void> updateTaskIntoDB(int id, Map<String, dynamic> values) async {
    emit(TasksLoadingState());
    try {
      await repository.updateTask(id, values);
      await getTasksFromDB();
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  void fillTaskFormFields(Map<String, dynamic> task) {
    titleController.text = task['title'];
    descriptionController.text = task['subTitle'];
    dateController.text = task['date'];
    currentTimeModel = TimeModel(
      hour: task['hour'],
      minute: task['minutes'],
      period: task['period'],
    );
  } //fill task form fields for update

  //set Notification Service
  Future<void> setNotificationService({
    required int id,
    required String title,
    required String body,
    scheduledTime,
  }) async {
    final notificationService = getIt<NotificationService>();
    await notificationService.scheduleNotification(
      id: id,
      title: "Reminder",
      body: title,
      scheduledTime: scheduledTime,
    );
  }

  //cancel Notification
  Future<void> cancelNotification(int id) async {
    final notificationService = getIt<NotificationService>();
    return notificationService.cancelNotification(id);
  }

  //delete Task from DB
  Future<void> deleteTaskFromDB(int id) async {
    emit(TasksLoadingState());
    try {
      await repository.deleteTask(id);
      await cancelNotification(id)
          .then((v) async {
            await getTasksFromDB();
          })
          .catchError((error) {
            emit(TasksErrorState(error.toString()));
          });
    } catch (e) {
      emit(TasksErrorState(e.toString()));
    }
  }

  //update Task
  Future<int> changeTaskStateTask(int id, int value) async {
    return await repository.changeTaskStateTask(id, value);
  }
}
