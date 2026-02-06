import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/core/widgets/Information_card.dart';
import 'package:tanzim/core/widgets/custom_app_bar.dart';
import 'package:tanzim/features/tasks/logic/cubit.dart';
import 'package:tanzim/features/tasks/logic/states.dart';
import 'package:tanzim/features/tasks/presentaion/shared_widgets.dart';
import 'package:tanzim/generated/l10n.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => TasksCubit()..getTasksFromDB(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<TasksCubit>();
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                int priority = 0;
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: AddTaskDialog(
                          onTimeModelChanged: cubit.fillTimeModel,
                          onDateModelChanged: cubit.fillDateModel,
                          titlecontroller: cubit.titleController,
                          descriptioncontroller: cubit.descriptionController,
                          datecontroller: cubit.dateController,
                          timecontroller: cubit.timeController,
                          onPriorityChanged: (value) {
                            priority = value;
                          },
                          onTap: () {
                            cubit
                                .submitCreateTask(
                                  timeErrorMsg: locale.notAllowedTime,
                                  priorityErrorMsg: locale.priorityValidate,
                                  priority: priority,
                                  formKey: formKey,
                                )
                                .then((sucsses) {
                                  if (sucsses) Navigator.of(context).pop();
                                });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: ColorManager.green,
              child: Icon(Icons.add, color: ColorManager.background),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    children: [
                      CustomAppBar(
                        text: locale.tasks,
                        widget: BlocBuilder<TasksCubit, TasksStates>(
                          builder: (context, state) {
                            var cubit = TasksCubit.get(context);
                            return Row(
                              children: [
                                Expanded(
                                  child: InformationCard(
                                    text: cubit.activeTasks.toString(),
                                    subText: locale.activeTasks,
                                    cardColor: ColorManager.green50,
                                    textColor: ColorManager.green,
                                  ),
                                ),
                                Expanded(
                                  child: InformationCard(
                                    text: cubit.completedTasks.toString(),
                                    subText: locale.completedTasks,
                                    cardColor: Color(0xFFE3F2FD),
                                    textColor: ColorManager.blue,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ), // colored information cards and back button and title
                      SizedBox(height: 20.h),
                      BlocBuilder<TasksCubit, TasksStates>(
                        builder: (context, state) {
                          var cubit = TasksCubit.get(context);
                          return Row(
                            children: [
                              DynamicColorsButton(
                                text: locale.allTasks,
                                isPressed: cubit.activeButton == 0
                                    ? true
                                    : false,
                                onTap: () {
                                  cubit.getTasksFromDB();
                                },
                              ),
                              DynamicColorsButton(
                                text: locale.completed,
                                isPressed: cubit.activeButton == 1
                                    ? true
                                    : false,
                                onTap: () {
                                  cubit.getCompleteTasksFromDB();
                                },
                              ),
                              DynamicColorsButton(
                                text: locale.active,
                                isPressed: cubit.activeButton == 2
                                    ? true
                                    : false,
                                onTap: () {
                                  cubit.getUnCompleteTasksFromDB();
                                },
                              ),
                            ],
                          );
                        },
                      ), // filter of tasks buttons
                      BlocBuilder<TasksCubit, TasksStates>(
                        builder: (context, state) {
                          final cubit = TasksCubit.get(context);
                          List<Map<String, dynamic>> currentTasks = [];
                          if (state is TasksLoadingState) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.green,
                                ),
                              ),
                            );
                          }
                          if (state is TasksLoadedState) {
                            currentTasks = state.tasks;
                          } else if (state is DoneTasksLoadedState) {
                            currentTasks = state.tasks;
                          } else if (state is UnDoneTasksLoadedState) {
                            currentTasks = state.tasks;
                          } else if (state is TasksErrorState) {
                            return Center(child: Text(state.message));
                          }

                          if (currentTasks.isNotEmpty) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (contex, index) => Dismissible(
                                key: Key(currentTasks[index]["id"].toString()),
                                confirmDismiss: (direction) async {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    return await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor:
                                            ColorManager.background,
                                        title: Text(
                                          S.of(context).deleteTaskTitle,
                                        ),
                                        content: Text(
                                          S.of(context).deleteTaskConfirmation,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(
                                              context,
                                            ).pop(false),
                                            child: Text(
                                              S.of(context).cancel,
                                              style: const TextStyle(
                                                color: ColorManager.green,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              cubit
                                                  .deleteTaskFromDB(
                                                    currentTasks[index]["id"],
                                                  )
                                                  .then(
                                                    (_) => Navigator.of(
                                                      context,
                                                    ).pop(true),
                                                  );
                                            },
                                            child: Text(
                                              S.of(context).delete,
                                              style: const TextStyle(
                                                color: ColorManager.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return null;
                                },
                                direction: DismissDirection.endToStart,
                                child: TaskInformationCard(
                                  longPress: () {
                                    int priority =
                                        currentTasks[index]['priority'];
                                    cubit.fillTaskFormFields(
                                      currentTasks[index],
                                    );
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: Form(
                                            key: formKey,
                                            child: AddTaskDialog(
                                              isUpdate: true,
                                              onTimeModelChanged:
                                                  cubit.fillTimeModel,
                                              onDateModelChanged:
                                                  cubit.fillDateModel,
                                              titlecontroller: cubit.titleController
                                                ..text =
                                                    currentTasks[index]['title'],
                                              descriptioncontroller:
                                                  cubit.descriptionController
                                                    ..text =
                                                        currentTasks[index]['subTitle'],
                                              datecontroller: cubit.dateController
                                                ..text =
                                                    currentTasks[index]['date'],
                                              timecontroller: cubit.timeController
                                                ..text =
                                                    '${currentTasks[index]['hour'].toString().padLeft(2, '0')}:${currentTasks[index]['minutes'].toString().padLeft(2, '0')} ${currentTasks[index]['period']}',
                                              onTap: () {
                                                cubit
                                                    .submitUpdateTask(
                                                      id: currentTasks[index]["id"],
                                                      timeErrorMsg:
                                                          locale.notAllowedTime,
                                                      priorityErrorMsg: locale
                                                          .priorityValidate,
                                                      priority: priority,
                                                      formKey: formKey,
                                                    )
                                                    .then((sucsses) {
                                                      if (sucsses)
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                    });
                                              },
                                              onPriorityChanged: (int p1) {
                                                priority = p1;
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  isDone: currentTasks[index]["isDone"] == 1
                                      ? true
                                      : false,
                                  colorOfPriority:
                                      cubit.getPriorityColor(
                                        currentTasks[index]["priority"],
                                        currentTasks[index]["isDone"] == 1
                                            ? false
                                            : true,
                                      ) ??
                                      ColorManager.lightGrey,
                                  title: currentTasks[index]["title"],
                                  subTitle: currentTasks[index]["subTitle"],
                                  textOfPriority: cubit.getPriorityText(
                                    context,
                                    currentTasks[index]["priority"],
                                  ),
                                  doneButton: () {
                                    cubit.changeStateOfTask(
                                      currentTasks[index]["id"],
                                      currentTasks[index]["isDone"] == 1
                                          ? 0
                                          : 1,
                                    );
                                  },
                                  date: currentTasks[index]["date"],
                                  hour: currentTasks[index]["hour"].toString(),
                                  minutes: currentTasks[index]["minutes"]
                                      .toString(),
                                  period: currentTasks[index]["period"],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: currentTasks.length,
                            );
                          } else {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Center(
                                child: Text(
                                  S.of(context).emptyTasks,
                                  style: TextStyle(
                                    fontSize: FontSize.s20,
                                    color: ColorManager.textLightGrey,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ), //list of tasks
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
