class SplashStates {}

class SplashInitialState extends SplashStates {}

class SplashLoadingState extends SplashStates {}

class SplashSuccessState extends SplashStates {}

class SplashErrorState extends SplashStates {
  final String error;

  SplashErrorState(this.error);
}
