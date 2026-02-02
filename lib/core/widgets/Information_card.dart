import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class InformationCard extends StatelessWidget {
  final String text;
  final String subText;
  final Color textColor;
  final Color cardColor;
  final bool crossAxisStart;
  const InformationCard({
    super.key,
    required this.text,
    required this.subText,
    required this.textColor,
    required this.cardColor,
    required this.crossAxisStart,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: crossAxisStart
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s35,
              color: textColor,
            ),
          ),
          Text(
            subText,
            style: TextStyle(
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s18,
              color: ColorManager.textLightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
