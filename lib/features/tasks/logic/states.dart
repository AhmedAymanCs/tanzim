abstract class TasksStates {}

class TasksInitialState extends TasksStates {}

class TasksLoadingState extends TasksStates {}

class ChangingActiveButtonState extends TasksStates {}

class ChangingStateOfTaskState extends TasksStates {}

class TasksLoadedState extends TasksStates {
  final List<Map<String, dynamic>> tasks;

  TasksLoadedState({required this.tasks});
}

class TasksErrorState extends TasksStates {
  final String message;
  TasksErrorState(this.message);
}
