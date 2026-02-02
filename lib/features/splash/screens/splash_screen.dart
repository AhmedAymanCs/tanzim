import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/features/onboarding/presentaion/onboarding_screen.dart';
import 'package:tanzim/features/splash/logic/cubit.dart';
import 'package:tanzim/features/splash/logic/states.dart';
import 'package:tanzim/generated/l10n.dart';
import 'package:tanzim/features/home/presentation/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startSplash(),
      child: BlocListener<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is SplashOldUserState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (state is SplashFirstLunchState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorManager.splashScreenBackground,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/logo.svg', fit: BoxFit.contain),
                const SizedBox(height: 20),
                Text(
                  S.of(context).title,
                  style: TextStyle(
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s50,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).subTitle,
                  style: TextStyle(
                    color: ColorManager.lightGrey,
                    fontWeight: FontWeightManager.semiBold,
                    fontSize: FontSize.s20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
