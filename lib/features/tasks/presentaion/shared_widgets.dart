import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class DynamicColorsButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isPressed;
  const DynamicColorsButton({
    super.key,
    this.onTap,
    required this.text,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isPressed ? ColorManager.green : ColorManager.appBarColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isPressed
                ? ColorManager.background
                : ColorManager.textLightGrey,
            fontSize: FontSize.s20,
            fontWeight: FontWeightManager.bold,
          ),
        ),
      ),
    );
  }
}

class TaskInformationCard extends StatelessWidget {
  final bool isDone;
  final Color colorOfPriority;
  final String textOfPriority;
  final String day;
  final String month;
  final String year;
  final String title;
  final String subTitle;
  final void Function()? deleteButton;
  final void Function()? doneButton;
  const TaskInformationCard({
    super.key,
    required this.isDone,
    required this.colorOfPriority,
    required this.textOfPriority,
    required this.day,
    required this.month,
    required this.year,
    required this.title,
    required this.subTitle,
    this.deleteButton,
    this.doneButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorManager.appBarColor,
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.all(color: ColorManager.lightGrey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGrey.withOpacity(0.2),
            offset: Offset(0, 5),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: doneButton,
            highlightColor: ColorManager.green.withOpacity(0.1),
            icon: Icon(
              isDone
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isDone
                  ? ColorManager.green
                  : ColorManager.lightGrey.withOpacity(0.5),
              size: 30,
            ),
          ), // button for done task
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isDone
                      ? ColorManager.textLightGrey.withOpacity(0.7)
                      : ColorManager.darkGrey,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                  fontWeight: FontWeightManager.bold,
                  fontSize: FontSize.s20,
                ),
              ), // title of task
              Text(
                subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorManager.textLightGrey,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s16,
                ),
              ), // subtitle of task
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorOfPriority.withOpacity(0.2),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: colorOfPriority,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text('عالية', style: TextStyle(color: colorOfPriority)),
                      ],
                    ),
                  ), //priority card
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.lightGrey.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: ColorManager.lightGrey.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '$year-$month-$day',
                          style: TextStyle(
                            color: ColorManager.lightGrey.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ), // calender card
                ],
              ), //
            ],
          ), //content of task

          Spacer(),
          IconButton(
            onPressed: deleteButton,
            highlightColor: ColorManager.red.withOpacity(0.1),
            icon: Icon(
              Icons.delete_forever_sharp,
              color: ColorManager.red.withOpacity(0.8),
              size: 30,
            ),
          ), // button for delete task
        ],
      ),
    );
  }
}
