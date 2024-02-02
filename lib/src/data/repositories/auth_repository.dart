import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_advance/src/data/firebase/firebase_service.dart';

enum AuthProvider { google, facebook, apple, email, }

enum Gender {male, female,} 

class AuthRepository {
  final FirebaseService firebaseService;

  AuthRepository({required this.firebaseService});

  Future<User?> signInWithGoogle() async {
    return await firebaseService.signInWithGoogle();
  }
}