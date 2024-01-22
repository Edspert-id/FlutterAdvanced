import 'package:flutter/material.dart';

class LoginWidgetsBody extends StatelessWidget {
  const LoginWidgetsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/login.png'),
        const SizedBox(height: 32),
        const Text(
          'Selamat Datang',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const Text(
          'Selamat Datang di Aplikasi Widya Edu\n'
          'Aplikasi Latihan dan Konsultasi Soal',
          style: TextStyle(
            color: Color(0xFF6A7483),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
