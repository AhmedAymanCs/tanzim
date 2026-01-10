import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class HomeScreenCard extends StatelessWidget {
  final text;
  final subText;
  final IconData icon;
  final List<Color> gradientColorsOfIcon;
  final List<Color> gradientColorsOfCard;
  const HomeScreenCard({
    super.key,
    required this.text,
    required this.subText,
    required this.icon,
    required this.gradientColorsOfIcon,
    required this.gradientColorsOfCard,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: 200,
    width: 200,
    margin: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: ColorManager.darkGrey.withOpacity(0.3),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: gradientColorsOfCard,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColorsOfIcon,
            ),
          ),
          child: Icon(icon, color: ColorManager.background, size: 40),
        ),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeightManager.bold,
            fontSize: FontSize.s28,
          ),
        ),
        SizedBox(height: 15),
        Text(
          subText,
          style: TextStyle(
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s16,
            color: ColorManager.textLightGrey,
          ),
        ),
      ],
    ),
  );
}
