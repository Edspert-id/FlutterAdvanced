import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController namaSekolahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
              ),
              controller: TextEditingController(
                  text: FirebaseAuth.instance.currentUser?.email),
              enabled: false,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nama Lengkap'),
              ),
              controller: namaLengkapController,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nama Sekolah'),
              ),
              controller: namaSekolahController,
            ),
            ElevatedButton(
              onPressed: () {
                String namaLengkap = namaLengkapController.text;
                String namaSekolah = namaSekolahController.text;
              },
              child: Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }
}
