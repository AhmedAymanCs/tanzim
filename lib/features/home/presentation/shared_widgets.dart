import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class HomeScreenCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final List<Color> gradientColorsOfIcon;
  final List<Color> gradientColorsOfCard;
  final void Function()? onTap;
  const HomeScreenCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.gradientColorsOfIcon,
    required this.gradientColorsOfCard,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGrey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 6),
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
              title,
              style: TextStyle(
                fontWeight: FontWeightManager.bold,
                fontSize: FontSize.s28,
              ),
            ),
            SizedBox(height: 15),
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s16,
                color: ColorManager.textLightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
