import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/generated/l10n.dart';
import 'package:tanzim/presentation/shared_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Scaffold(
      backgroundColor: ColorManager.background2,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.4),
        title: Text(
          locale.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: FontSize.s22,
            color: ColorManager.darkGrey,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          color: ColorManager.darkGrey,
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            color: ColorManager.darkGrey,
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
          IconButton(
            color: ColorManager.darkGrey,
            onPressed: () {},
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              locale.home,
              style: TextStyle(
                fontSize: FontSize.s35,
                fontWeight: FontWeightManager.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              locale.subHome,
              style: TextStyle(
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.regular,
                color: ColorManager.lightGrey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 1.7,
              ),
              children: [
                HomeScreenCard(
                  text: locale.tasks,
                  subText: locale.subTasks,
                  icon: Icons.task_alt,
                  gradientColorsOfIcon: ColorManager.taskIconGradient,
                  gradientColorsOfCard: ColorManager.taskCardGradient,
                ),
                HomeScreenCard(
                  text: locale.notes,
                  subText: locale.subNotes,
                  icon: Icons.description_outlined,
                  gradientColorsOfIcon: ColorManager.notesIconGradient,
                  gradientColorsOfCard: ColorManager.notesCardGradient,
                ),
                HomeScreenCard(
                  text: locale.reports,
                  subText: locale.subReports,
                  icon: Icons.bar_chart_rounded,
                  gradientColorsOfIcon: ColorManager.reportsIconGradient,
                  gradientColorsOfCard: ColorManager.reportsCardGradient,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
