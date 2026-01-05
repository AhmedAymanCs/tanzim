import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tanzim/core/manager/font_manager.dart';
import 'package:tanzim/features/splash/cubit/cubit.dart';
import 'package:tanzim/features/splash/cubit/states.dart';
import 'package:tanzim/generated/l10n.dart';
import '../../../presentation/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startSplash(),
      child: BlocListener<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        child: Scaffold(
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
                    color: Colors.grey,
                    fontWeight: FontWeightManager.bold,
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
