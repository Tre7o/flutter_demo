class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory SignInWithEmailAndPasswordFailure.code(String code){

    switch(code){

      case 'invalid-email': return const SignInWithEmailAndPasswordFailure('Email is not valid or badly formatted.');

      case 'invalid-credential': return const SignInWithEmailAndPasswordFailure('Password is incorrect');

      case 'user-not-found': return const SignInWithEmailAndPasswordFailure('Email or password do not match');

      case 'email-already-in-use': return const SignInWithEmailAndPasswordFailure('Email is already in use');

      case 'too-many-requests': return const SignInWithEmailAndPasswordFailure('Too many requests');

      case 'operation-not-allowed': return const SignInWithEmailAndPasswordFailure('Operation is not allowed. Please contact support.');

      case 'user-disabled': return const SignInWithEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');

      default: return const SignInWithEmailAndPasswordFailure();
    }
  }

}

