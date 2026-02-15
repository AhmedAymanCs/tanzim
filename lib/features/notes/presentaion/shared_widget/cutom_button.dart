import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.appBarColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: TextStyle(
              fontSize: FontSize.s20,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'SubTitle,SubTitleSubTitleSubTitleSubTitleSubTitleSubTtleSubTitleSubTitleSubTitleSubitleSubTitle',
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.regular,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50.h,
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: ColorManager.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Add Note',
          style: TextStyle(
            fontSize: FontSize.s20,
            fontWeight: FontWeightManager.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
