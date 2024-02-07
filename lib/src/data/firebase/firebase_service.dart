import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredentialResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredentialResult.user;
    } catch (e) {
      debugPrint('Err signInWithGoogle $e');
      return null;
    }
  }

  Future<String?> uploadFile(
      {required String fileName, required Uint8List fileByte}) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('${FirebaseAuth.instance.currentUser?.email}')
          .child(fileName);

      /// Upload
      await ref.putData(fileByte);

      /// Get download url
      return await ref.getDownloadURL();
    } catch (e) {
      debugPrint('Err uploadFile: $e');
      return null;
    }
  }

  Future<void> writeChat(String message) async {
    await FirebaseFirestore.instance.collection('chats').add(
      {
        'message': message,
        'email': FirebaseAuth.instance.currentUser?.email,
        'timestamp': Timestamp.now(),
      },
    );
  }
}
