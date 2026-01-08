import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/local/di/service_locator.dart';
import 'package:tanzim/core/local/shared_pref/shared_pref_impl.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/features/onboarding/logic/states.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitialState());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  AppPreference pref = getIt<AppPreference>();
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

  void finishOnboarding() async {
    await pref.setFirstLaunch(false);
    emit(OnboardingCompleteState());
  }
}
