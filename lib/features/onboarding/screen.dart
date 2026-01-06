import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/features/onboarding/cubit/cubit.dart';
import 'package:tanzim/features/onboarding/cubit/states.dart';
import 'package:tanzim/generated/l10n.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingStates>(
        builder: (context, state) {
          var cubit = OnboardingCubit.get(context);

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: cubit.pageController,
                    onPageChanged: (index) {
                      cubit.currentIndex = index;
                      cubit.swipe(index);
                    },
                    children: [
                      OnboardingScreenBuilder(
                        icon: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: BoxBorder.all(
                              color: ColorManager.green,
                              width: 6,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 60,
                            color: ColorManager.green,
                          ),
                        ),
                        title: locale.onboardingTitle1,
                        subTitle: locale.onboardingSubTitle1,
                      ), //first page
                      OnboardingScreenBuilder(
                        icon: Icon(
                          Icons.description_outlined,
                          color: ColorManager.blue,
                          size: 100,
                        ),
                        title: locale.onboardingTitle2,
                        subTitle: locale.onboardingSubTitle2,
                      ), //second page
                      OnboardingScreenBuilder(
                        icon: Icon(
                          Icons.bar_chart_rounded,
                          color: ColorManager.purple,
                          size: 100,
                        ),
                        title: locale.onboardingTitle3,
                        subTitle: locale.onboardingSubTitle3,
                      ), //third page
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: cubit.currentIndex == index ? 30 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: cubit.currentIndex == index
                              ? cubit.colors[cubit.currentIndex]
                              : ColorManager.lightGrey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      );
                    }),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: cubit.colors[cubit.currentIndex],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.changePageButton();
                              print(cubit.currentIndex);
                            },
                            child: Text(
                              cubit.currentIndex < 2
                                  ? locale.next
                                  : locale.getStarted,
                              style: TextStyle(
                                color: ColorManager.background,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeightManager.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.background,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OnboardingScreenBuilder extends StatelessWidget {
  OnboardingScreenBuilder({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  String title;
  String subTitle;
  Widget icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: FontSize.s35,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.regular,
                color: ColorManager.lightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
