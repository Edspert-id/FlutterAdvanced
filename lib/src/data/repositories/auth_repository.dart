import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_advance/src/data/firebase/firebase_service.dart';
import 'package:flutter_advance/src/data/network/http_config.dart';
import 'package:flutter_advance/src/domain/entities/registration_model.dart';

enum AuthProvider {
  google,
  facebook,
  apple,
  email,
}

enum Gender {
  male,
  female,
}

class AuthRepository {
  final FirebaseService firebaseService;

  AuthRepository({required this.firebaseService});

  Future<User?> signInWithGoogle() async {
    return await firebaseService.signInWithGoogle();
  }

  Future<String?> uploadFile(
      {required String fileName, required Uint8List fileByte}) async {
    return await firebaseService.uploadFile(
        fileName: fileName, fileByte: fileByte);
  }

  Future<bool> registrationUser(RegistrationModel registrationModel) async {
    final response = await HttpConfig.dioConfig().post(
      'users/registrasi',
      data: registrationModel.toMap(),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
