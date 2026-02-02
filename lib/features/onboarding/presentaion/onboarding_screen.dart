import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/features/onboarding/logic/cubit.dart';
import 'package:tanzim/features/onboarding/logic/states.dart';
import 'package:tanzim/features/onboarding/presentaion/shared_widgets.dart';
import 'package:tanzim/generated/l10n.dart';
import 'package:tanzim/features/home/presentation/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocListener<OnboardingCubit, OnboardingStates>(
        listener: (context, state) {
          if (state is OnboardingCompleteState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingStates>(
          builder: (context, state) {
            var cubit = OnboardingCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        cubit.finishOnboarding();
                      },
                      child: Text(
                        locale.onboardingSkip,
                        style: TextStyle(
                          color: ColorManager.textLightGrey,
                          fontSize: FontSize.s18,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: cubit.pageController,
                        onPageChanged: (index) {
                          cubit.swipe(index);
                        },
                        children: [
                          onboardingScreenBuilder(
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
                          onboardingScreenBuilder(
                            icon: Icon(
                              Icons.description_outlined,
                              color: ColorManager.blue,
                              size: 100,
                            ),
                            title: locale.onboardingTitle2,
                            subTitle: locale.onboardingSubTitle2,
                          ), //second page
                          onboardingScreenBuilder(
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
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: cubit.colors[cubit.currentIndex],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (cubit.currentIndex < 2) {
                                cubit.changePageButton();
                              } else {
                                cubit.finishOnboarding();
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  cubit.currentIndex < 2
                                      ? locale.next
                                      : locale.getStarted,
                                  style: TextStyle(
                                    color: ColorManager.background,
                                    fontSize: FontSize.s22,
                                    fontWeight: FontWeightManager.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorManager.background,
                                  size: 25,
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
            );
          },
        ),
      ),
    );
  }
}
