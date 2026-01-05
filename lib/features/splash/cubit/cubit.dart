import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanzim/features/splash/cubit/states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState());

  static SplashCubit get(context) => BlocProvider.of(context);

  void startSplash() async {
    emit(SplashLoadingState());
    Future.delayed(Duration(seconds: 3))
        .then((value) {
          emit(SplashSuccessState());
        })
        .catchError((error) {
          emit(SplashErrorState(error.toString()));
        });
  }
}
