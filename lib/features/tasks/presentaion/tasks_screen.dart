import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    var locale = S.of(context);
    return BlocProvider(
      create: (BuildContext context) => TasksCubit()..getTasksFromDB(),
      child: Scaffold(
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
                      text: 'كل المهام',
                      isPressed: cubit.activeButton == 0 ? true : false,
                      onTap: () {
                        cubit.changeActiveButton(0);
                        cubit.insertTaskIntoDB({
                          "title": "Finish",
                          "subTitle": "clear",
                          "isDone": "1",
                        });
                      },
                    ),
                    DynamicColorsButton(
                      text: 'مكتملة',
                      isPressed: cubit.activeButton == 1 ? true : false,
                      onTap: () {
                        cubit.changeActiveButton(1);
                      },
                    ),
                    DynamicColorsButton(
                      text: 'نشطة',
                      isPressed: cubit.activeButton == 2 ? true : false,
                      onTap: () {
                        cubit.changeActiveButton(2);
                      },
                    ),
                  ],
                );
              },
            ), // filter of tasks buttons
            Expanded(
              child: BlocBuilder<TasksCubit, TasksStates>(
                builder: (context, state) {
                  var cubit = TasksCubit.get(context);
                  if (state is TasksLoadedState) {
                    if (state.tasks.length != 0) {
                      return ListView.separated(
                        itemBuilder: (contex, index) => TaskInformationCard(
                          isDone: cubit.isDone,
                          colorOfPriority: ColorManager.red,
                          title: state.tasks[index]["title"],
                          subTitle: 'Prepare monthly report',
                          textOfPriority: 'عالية',
                          day: '1',
                          month: '1',
                          year: '2026',
                          doneButton: () {
                            cubit.changeStateOfTask();
                          },
                          deleteButton: () {
                            cubit.deleteTaskFromDB(state.tasks[index]["id"]);
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: state.tasks.length,
                      );
                    }
                  } else if (state is TasksErrorState) {
                    return Text(state.message);
                  }
                  return Center(child: Text('No Tasks yet.'));
                  ;
                },
              ),
            ), //list of tasks
          ],
        ),
      ),
    );
  }
}
