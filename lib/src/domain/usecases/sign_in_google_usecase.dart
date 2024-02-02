import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_advance/src/data/repositories/auth_repository.dart';

import 'usecase.dart';

class SignInWithGoogleUsecase implements UseCase<User?, void> {
  final AuthRepository authRepository;

  SignInWithGoogleUsecase(this.authRepository);
  @override
  Future<User?> call(void params) {
    return authRepository.signInWithGoogle();
  }
}