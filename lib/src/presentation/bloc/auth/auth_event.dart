part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final RegistrationModel data;

  RegisterUserEvent({required this.data});
}

class UploadProfilePictureEvent extends AuthEvent {
  final UploadFileParams params;

  UploadProfilePictureEvent({required this.params});
}