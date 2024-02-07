import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_advance/src/domain/entities/registration_model.dart';
import 'package:flutter_advance/src/domain/usecases/registration_usecase.dart';
import 'package:flutter_advance/src/domain/usecases/sign_in_google_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/upload_file_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final RegistrationUsecase registrationUsecase;
  final UploadFileUsecase uploadFileUsecase;

  AuthBloc(
    this.signInWithGoogleUsecase,
    this.registrationUsecase,
    this.uploadFileUsecase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        emit(SignInWithGoogleLoading());

        final user = await signInWithGoogleUsecase(null);
        if (user != null) {
          emit(SignInWithGoogleSuccess(email: user.email!));
        } else {
          emit(SignInWithGoogleError('Something went wrong.'));
        }
      }

      if (event is RegisterUserEvent) {
        emit(RegistrationLoading());
        final result = await registrationUsecase(event.data);
        if (result) {
          emit(RegistrationSuccess());
        } else {
          emit(RegistrationError('Something went wrong'));
        }
      }

      if (event is UploadProfilePictureEvent) {
        emit(UploadProfilePicLoading());
        final downloadUrl = await uploadFileUsecase(event.params);
        if (downloadUrl != null) {
          emit(UploadProfilePicSuccess(downloadUrl: downloadUrl));
        } else {
          emit(UploadProfilePicError('Failed to upload!'));
        }
      }
    });
  }
}
