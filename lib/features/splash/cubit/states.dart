class SplashStates {}

class SplashInitialState extends SplashStates {}

class SplashLoadingState extends SplashStates {}

class SplashFirstLunchState extends SplashStates {}

class SplashOldUserState extends SplashStates {}

class SplashErrorState extends SplashStates {
  final String error;

  SplashErrorState(this.error);
}
