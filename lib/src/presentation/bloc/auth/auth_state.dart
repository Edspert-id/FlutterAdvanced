part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInWithGoogleLoading extends AuthState {}

final class SignInWithGoogleSuccess extends AuthState {
  final String email;

  SignInWithGoogleSuccess({required this.email});
}

final class SignInWithGoogleError extends AuthState {
  final String errorMessage;

  SignInWithGoogleError(this.errorMessage);
}

final class RegistrationLoading extends AuthState {}
final class RegistrationSuccess extends AuthState {}
final class RegistrationError extends AuthState {
  final String errorMessage;

  RegistrationError(this.errorMessage);
}

final class UploadProfilePicLoading extends AuthState {}
final class UploadProfilePicSuccess extends AuthState {
  final String downloadUrl;

  UploadProfilePicSuccess({required this.downloadUrl});
}
final class UploadProfilePicError extends AuthState {
  final String errorMessage;

  UploadProfilePicError(this.errorMessage);
}
