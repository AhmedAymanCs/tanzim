import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';

class onboardingScreenBuilder extends StatelessWidget {
  final title;
  final subTitle;
  final icon;
  const onboardingScreenBuilder({
    super.key,
    this.title,
    this.subTitle,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          SizedBox(height: 30),
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: FontSize.s35,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              subTitle ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.regular,
                color: ColorManager.textLightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget onboardingScreenBuilder({
//   String? title,
//   String? subTitle,
//   Widget? icon,
// }) => Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       icon ?? SizedBox(),
//       SizedBox(height: 30),
//       Text(
//         title ?? '',
//         style: TextStyle(
//           fontSize: FontSize.s35,
//           fontWeight: FontWeightManager.bold,
//         ),
//       ),
//       SizedBox(height: 30),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//         child: Text(
//           subTitle ?? '',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: FontSize.s20,
//             fontWeight: FontWeightManager.regular,
//             color: ColorManager.textLightGrey,
//           ),
//         ),
//       ),
//     ],
//   ),
// );
