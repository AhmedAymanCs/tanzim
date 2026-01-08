class OnboardingStates {}

class OnboardingInitialState extends OnboardingStates {}

class OnboardingChangePageState extends OnboardingStates {}

class OnboardingCompleteState extends OnboardingStates {}

class OnboardingErrorState extends OnboardingStates {
  final String error;

  OnboardingErrorState(this.error);
}
