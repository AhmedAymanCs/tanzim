import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Widget? widget;
  const CustomAppBar({super.key, required this.text, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                text,
                style: TextStyle(
                  fontWeight: FontWeightManager.bold,
                  fontSize: FontSize.s28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          widget ?? SizedBox(),
        ],
      ),
    );
  }
}
