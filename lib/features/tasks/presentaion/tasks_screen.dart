import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/features/tasks/logic/cubit.dart';
import 'package:tanzim/features/tasks/logic/states.dart';
import 'package:tanzim/features/tasks/presentaion/shared_widgets.dart';
import 'package:tanzim/generated/l10n.dart';
import 'package:tanzim/presentation/shared_widgets.dart';

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
                          titlecontroller: cubit.titleController,
                          descriptioncontroller: cubit.descriptionController,
                          datecontroller: cubit.dateController,
                          timecontroller: cubit.timeController,
                          onPriorityChanged: (value) {
                            priority = value;
                          },
                          onTap: () {
                            if (formKey.currentState!.validate() &&
                                priority != 0) {
                              cubit
                                  .insertTaskIntoDB({
                                    "title": cubit.titleController.text,
                                    "subTitle":
                                        cubit.descriptionController.text,
                                    "time": cubit.timeController.text,
                                    "date": cubit.dateController.text,
                                    "priority": priority,
                                    "isDone": 0,
                                  })
                                  .then((value) {
                                    print(priority);
                                    Navigator.pop(context);
                                    cubit.titleController.text = "";
                                    cubit.descriptionController.text = "";
                                    cubit.timeController.text = "";
                                    cubit.dateController.text = "";
                                  });
                            } else if (priority == 0) {
                              Fluttertoast.showToast(
                                msg: S.of(context).priorityValidate,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: ColorManager.green,
                              );
                            }
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
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.lightGrey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                    color: ColorManager.appBarColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, size: 30),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            locale.tasks,
                            style: TextStyle(
                              fontWeight: FontWeightManager.bold,
                              fontSize: FontSize.s28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<TasksCubit, TasksStates>(
                        builder: (context, state) {
                          var cubit = TasksCubit.get(context);
                          return Row(
                            children: [
                              InformationCard(
                                text: cubit.activeTasks.toString(),
                                subText: locale.activeTasks,
                                cardColor: ColorManager.green50,
                                textColor: ColorManager.green,
                              ),
                              InformationCard(
                                text: cubit.completedTasks.toString(),
                                subText: locale.completedTasks,
                                cardColor: Color(0xFFE3F2FD),
                                textColor: ColorManager.blue,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ), // colored information cards and back button and title
                const SizedBox(height: 20),
                BlocBuilder<TasksCubit, TasksStates>(
                  builder: (context, state) {
                    var cubit = TasksCubit.get(context);
                    return Row(
                      children: [
                        DynamicColorsButton(
                          text: locale.allTasks,
                          isPressed: cubit.activeButton == 0 ? true : false,
                          onTap: () {
                            cubit.getTasksFromDB();
                          },
                        ),
                        DynamicColorsButton(
                          text: locale.completed,
                          isPressed: cubit.activeButton == 1 ? true : false,
                          onTap: () {
                            cubit.getCompleteTasksFromDB();
                          },
                        ),
                        DynamicColorsButton(
                          text: locale.active,
                          isPressed: cubit.activeButton == 2 ? true : false,
                          onTap: () {
                            cubit.getUnCompleteTasksFromDB();
                          },
                        ),
                      ],
                    );
                  },
                ), // filter of tasks buttons
                Expanded(
                  child: BlocBuilder<TasksCubit, TasksStates>(
                    builder: (context, state) {
                      final cubit = TasksCubit.get(context);
                      List<Map<String, dynamic>>? currentTasks = [];
                      if (state is TasksLoadedState) {
                        currentTasks = state.tasks;
                      } else if (state is DoneTasksLoadedState) {
                        currentTasks = state.tasks;
                      } else if (state is UnDoneTasksLoadedState) {
                        currentTasks = state.tasks;
                      } else if (state is TasksErrorState) {
                        return Text(state.message);
                      }
                      if (currentTasks!.isNotEmpty) {
                        if (currentTasks.isNotEmpty) {
                          return ListView.separated(
                            itemBuilder: (contex, index) => TaskInformationCard(
                              isDone: currentTasks![index]["isDone"] == 1
                                  ? true
                                  : false,
                              colorOfPriority:
                                  cubit.getPriorityColor(
                                    currentTasks[index]["priority"],
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
                                  currentTasks![index]["id"],
                                  currentTasks[index]["isDone"] == 1 ? 0 : 1,
                                );
                              },
                              deleteButton: () {
                                cubit.deleteTaskFromDB(
                                  currentTasks![index]["id"],
                                );
                              },
                              date: currentTasks[index]["date"],
                              time: currentTasks[index]["time"],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: currentTasks.length,
                          );
                        }
                      } else {
                        return Center(child: Text('No Tasks yet.'));
                      }
                      return Center(child: Text('No Tasks yet.'));
                    },
                  ),
                ), //list of tasks
              ],
            ),
          );
        },
      ),
    );
  }
}
