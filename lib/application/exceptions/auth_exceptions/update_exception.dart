class UpdateFailure {
  final String message;

  const UpdateFailure([this.message = "An Unknown error occurred."]);

  factory UpdateFailure.code(String code){

    switch(code){

      case 'invalid-email': return const UpdateFailure('Email is not valid or badly formatted.');

      case 'user-not-found': return const UpdateFailure('Email or password do not match');

      case 'too-many-requests': return const UpdateFailure('Too many requests');

      case 'operation-not-allowed': return const UpdateFailure('Operation is not allowed. Please contact support.');

      case 'user-disabled': return const UpdateFailure('This user has been disabled. Please contact support for help.');

      default: return const UpdateFailure();
    }
  }

}

