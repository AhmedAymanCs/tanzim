import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/core/manager/values_manager.dart';
import 'package:tanzim/features/notes/presentaion/note_screen.dart';
import 'package:tanzim/features/tasks/presentaion/tasks_screen.dart';
import 'package:tanzim/generated/l10n.dart';
import 'package:tanzim/features/home/presentation/shared_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.4),
        title: Text(
          locale.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: FontSize.s18,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p12),
              child: Text(
                locale.home,
                style: TextStyle(
                  fontSize: FontSize.s28,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Text(
                locale.subHome,
                style: TextStyle(
                  fontSize: FontSize.s18,
                  fontWeight: FontWeightManager.regular,
                  color: ColorManager.lightGrey,
                ),
              ),
            ),
            SizedBox(height: AppSize.s20h),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width > 500
                    ? 400
                    : MediaQuery.of(context).size.width,
                mainAxisSpacing: AppSize.s20h,
                crossAxisSpacing: AppSize.s20w,
                childAspectRatio: 1.3.h,
              ),
              children: [
                HomeScreenCard(
                  title: locale.tasks,
                  subTitle: locale.subTasks,
                  icon: Icons.task_alt,
                  gradientColorsOfIcon: ColorManager.taskIconGradient,
                  gradientColorsOfCard: ColorManager.taskCardGradient,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksScreen()),
                    );
                  },
                ), //Task Card

                HomeScreenCard(
                  title: locale.notes,
                  subTitle: locale.subNotes,
                  icon: Icons.description_outlined,
                  gradientColorsOfIcon: ColorManager.notesIconGradient,
                  gradientColorsOfCard: ColorManager.notesCardGradient,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotesScreen()),
                    );
                  },
                ), //Notes Card
                HomeScreenCard(
                  title: locale.reports,
                  subTitle: locale.subReports,
                  icon: Icons.bar_chart_rounded,
                  gradientColorsOfIcon: ColorManager.reportsIconGradient,
                  gradientColorsOfCard: ColorManager.reportsCardGradient,
                ), //Reports card
              ],
            ),
          ],
        ),
      ),
    );
  }
}
