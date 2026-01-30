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

class InformationCard extends StatelessWidget {
  final String text;
  final String subText;
  final Color textColor;
  final Color cardColor;
  const InformationCard({
    super.key,
    required this.text,
    required this.subText,
    required this.textColor,
    required this.cardColor,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
  }
}

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
          widget ?? SizedBox(),
        ],
      ),
    );
  }
}
