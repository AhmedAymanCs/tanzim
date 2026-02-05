import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/features/tasks/data/model/date_model.dart';
import 'package:tanzim/features/tasks/data/model/time_model.dart';
import 'package:tanzim/generated/l10n.dart';

//dynamic color button widget
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
        margin: EdgeInsets.symmetric(horizontal: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.w),
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

//task information card widget
class TaskInformationCard extends StatelessWidget {
  final bool isDone;
  final Color colorOfPriority;
  final String textOfPriority;
  final String date;
  final String hour;
  final String minutes;
  final String period;
  final String title;
  final String subTitle;
  final void Function()? doneButton;
  final void Function()? longPress;
  const TaskInformationCard({
    super.key,
    required this.isDone,
    required this.colorOfPriority,
    required this.textOfPriority,
    required this.title,
    required this.subTitle,
    this.doneButton,
    required this.date,
    required this.hour,
    required this.minutes,
    required this.period,
    this.longPress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: ColorManager.appBarColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.lightGrey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGrey.withOpacity(0.2),
            offset: const Offset(0, 5),
            blurRadius: 3,
          ),
        ],
      ),
      child: Material(
        color: ColorManager.appBarColor, // to match the container color
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: ColorManager.green400.withOpacity(0.2),
          onLongPress: longPress,
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: doneButton,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDone
                            ? ColorManager.green
                            : ColorManager.lightGrey.withOpacity(0.5),
                        width: 3,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      color: isDone
                          ? ColorManager.green
                          : ColorManager.lightGrey.withOpacity(0.5),
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),

                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: isDone
                              ? ColorManager.textLightGrey.withOpacity(0.7)
                              : ColorManager.darkGrey,
                          decoration: isDone
                              ? TextDecoration.lineThrough
                              : null,
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: ColorManager.textLightGrey,
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          PriorityCard(
                            text: textOfPriority,
                            colorOfPriority: colorOfPriority,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorManager.lightGrey.withOpacity(0.1),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    size: 15.h,
                                    color: ColorManager.lightGrey,
                                  ),
                                  SizedBox(width: 4.w),
                                  Flexible(
                                    child: Text(
                                      date,
                                      style: TextStyle(
                                        fontSize: FontSize.s12,
                                        color: ColorManager.lightGrey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 5.w),

                Text(
                  period,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    fontWeight: FontWeightManager.bold,
                    color: isDone
                        ? ColorManager.darkGrey.withOpacity(0.4)
                        : (period == "PM"
                              ? ColorManager.lightGrey.withOpacity(0.4)
                              : ColorManager.blue.withOpacity(0.4)),
                    fontFamily: 'Digital',
                  ),
                ),

                SizedBox(width: 8.w),

                Container(
                  padding: EdgeInsets.all(15.h),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: ColorManager.appBarColor,
                    shape: BoxShape.circle,
                    border: BoxBorder.all(color: colorOfPriority, width: 0.5.h),
                    boxShadow: [
                      BoxShadow(
                        color: colorOfPriority.withOpacity(0.2),
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          hour.padLeft(2, '0'),
                          style: TextStyle(
                            height: 1,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.bold,
                            color: colorOfPriority.withOpacity(0.7),
                            fontFamily: 'Digital',
                          ),
                        ),
                        Text(
                          minutes.padLeft(2, '0'),
                          style: TextStyle(
                            height: 1,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: 'Digital',
                            color: colorOfPriority.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//stateful widget for add task dialog on tap add task button
class AddTaskDialog extends StatefulWidget {
  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;
  final TextEditingController datecontroller;
  final TextEditingController timecontroller;
  final void Function() onTap;
  final void Function(int) onPriorityChanged;
  final void Function(TimeModel) onTimeModelChanged;
  final void Function(DateModel) onDateModelChanged;
  AddTaskDialog({
    super.key,
    required this.titlecontroller,
    required this.descriptioncontroller,
    required this.datecontroller,
    required this.timecontroller,
    required this.onTap,
    required this.onPriorityChanged,
    required this.onTimeModelChanged,
    required this.onDateModelChanged,
  });
  int priority = 0;
  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

//state of add task dialog
class _AddTaskDialogState extends State<AddTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.background,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).addTask,
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              // title form
              TaskTextField(
                controller: widget.titlecontroller,
                label: S.of(context).taskTitle,
                color: ColorManager.blue,
                focusColor: ColorManager.green,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return S.of(context).validate;
                  }
                  return null;
                },
              ),

              SizedBox(height: 30.h),
              // decription form
              TaskTextField(
                controller: widget.descriptioncontroller,
                label: S.of(context).taskDescription,
                color: ColorManager.blue,
                focusColor: ColorManager.green,
                maxLine: 2,
              ),

              SizedBox(height: 30.h),

              //pick date form
              TaskTextField(
                controller: widget.datecontroller,
                label: S.of(context).date,
                color: ColorManager.blue,
                focusColor: ColorManager.green,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    builder: (context, child) => Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          surface: ColorManager.background,
                          primary: ColorManager.green,
                        ),
                      ),
                      child: child!,
                    ),
                  ).then((date) {
                    widget.onDateModelChanged(
                      DateModel(
                        day: date!.day,
                        month: date.month,
                        year: date.year,
                      ),
                    );
                    widget.datecontroller.text =
                        '${date.day} - ${date.month} - ${date.year}';
                  });
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return S.of(context).validate;
                  }
                  return null;
                },
                readOnly: true,
                showCursor: false,
              ),

              SizedBox(height: 30.h),
              //pick time form
              TaskTextField(
                controller: widget.timecontroller,
                label: S.of(context).time,
                color: ColorManager.blue,
                focusColor: ColorManager.green,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) => Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: ColorManager.green,
                          onSurface: ColorManager.darkGrey,
                        ),
                        timePickerTheme: TimePickerThemeData(
                          dayPeriodColor: ColorManager.green,
                        ),
                      ),
                      child: child!,
                    ),
                  ).then((pickedTime) {
                    int hour = pickedTime!.hour;
                    final minute = pickedTime.minute.toString().padLeft(2, '0');
                    final period = hour >= 12 ? 'PM' : 'AM';
                    if (hour > 12) hour -= 12;
                    if (hour == 0) hour = 12;
                    widget.timecontroller.text = '$hour:$minute $period';
                    widget.onTimeModelChanged(
                      TimeModel(
                        hour: hour,
                        minute: int.parse(minute),
                        period: period,
                      ),
                    );
                  });
                },
                readOnly: true,
                showCursor: false,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return S.of(context).validate;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              Text(
                S.of(context).priority,
                style: TextStyle(
                  color: ColorManager.darkGrey,
                  fontSize: FontSize.s28,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.priority = 1;
                          });
                          widget.onPriorityChanged(1);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: widget.priority == 1
                                ? ColorManager.red
                                : ColorManager.lightGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            S.of(context).high,
                            style: TextStyle(
                              color: ColorManager.background,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.priority = 2;
                          });
                          widget.onPriorityChanged(2);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: widget.priority == 2
                                ? ColorManager.orange
                                : ColorManager.lightGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            S.of(context).medium,
                            style: TextStyle(
                              color: ColorManager.background,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.priority = 3;
                          });
                          widget.onPriorityChanged(3);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: widget.priority == 3
                                ? ColorManager.green
                                : ColorManager.lightGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            S.of(context).low,
                            style: TextStyle(
                              color: ColorManager.background,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.green,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.of(context).save,
                    style: TextStyle(
                      color: ColorManager.background,
                      fontWeight: FontWeightManager.bold,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom text field widget
class TaskTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final Color focusColor;
  final Color color;
  final int? maxLine;
  final bool? readOnly;
  final bool? showCursor;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const TaskTextField({
    super.key,
    required this.label,
    required this.color,
    required this.focusColor,
    this.maxLine,
    this.readOnly,
    this.onTap,
    this.showCursor,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: showCursor,
      maxLines: maxLine ?? 1,
      cursorColor: focusColor,
      readOnly: readOnly ?? false,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: TextStyle(color: ColorManager.darkGrey.withOpacity(0.7)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: focusColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: ColorManager.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.red),
        ),
      ),
    );
  }
}

//priority card widget
class PriorityCard extends StatelessWidget {
  final String text;
  final Color colorOfPriority;
  const PriorityCard({
    super.key,
    required this.text,
    required this.colorOfPriority,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorOfPriority.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, color: colorOfPriority, size: 15),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(color: colorOfPriority, fontSize: FontSize.s12),
          ),
        ],
      ),
    );
  }
}
