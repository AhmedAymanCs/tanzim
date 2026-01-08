import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/core/local/di/service_locator.dart';
import 'package:tanzim/core/local/shared_pref/shared_pref_impl.dart';
import 'package:tanzim/features/splash/logic/states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState());

  static SplashCubit get(context) => BlocProvider.of(context);

  AppPreference prefs = getIt<AppPreference>();

  void startSplash() async {
    emit(SplashLoadingState());

    Future.delayed(Duration(seconds: 2))
        .then((value) {
          isFirstLaunch();
        })
        .catchError((error) {
          emit(SplashErrorState(error.toString()));
        });
  }

  bool isFirstLaunch() {
    if (prefs.isFirstLaunch) {
      emit(SplashFirstLunchState());
      return true;
    }
    emit(SplashOldUserState());
    return false;
  }
}
