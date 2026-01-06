import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/features/onboarding/cubit/states.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitialState());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();
  int currentIndex = 0;
  List<Color> colors = [
    ColorManager.green,
    ColorManager.blue,
    ColorManager.purple,
  ];
  void changePageButton() {
    if (pageController.page! < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      currentIndex = pageController.page!.toInt();
    }
    emit(OnboardingChangePageState());
  }

  void swipe(index) {
    currentIndex = index;
    emit(OnboardingChangePageState());
  }
}
