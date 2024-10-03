abstract class StoreEmailVerificationStates {}

class StoreEmailVerificationInitialState extends StoreEmailVerificationStates {}

class StoreEmailVerificationSuccessState extends StoreEmailVerificationStates {
  final String message;

  StoreEmailVerificationSuccessState(this.message);
}

class StoreEmailVerificationErrorState extends StoreEmailVerificationStates {
  final String error;

  StoreEmailVerificationErrorState({required this.error});
}

class StoreEmailVerificationLoadingState extends StoreEmailVerificationStates {}

class StoreEmailVerificationChangeOtpState
    extends StoreEmailVerificationStates {}

class StoreEmailVerificationButtonEnabledState
    extends StoreEmailVerificationStates {}
