import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/auth/auth_bloc.dart';
import '../widgets/login_buttons.dart';
import '../widgets/login_widgets_body.dart';
import 'registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous is SignInWithGoogleLoading &&
              current is SignInWithGoogleSuccess) ||
          (previous is SignInWithGoogleLoading &&
              current is SignInWithGoogleError),
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          Fluttertoast.showToast(
            msg: "Signed in using ${state.email}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ),);
        }

        if (state is SignInWithGoogleError) {
          Fluttertoast.showToast(
            msg: "Failed to sign in with Google",
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Center(
              child: Row(
                children: [
                  const LoginWidgetsBody(),
                  LoginButtons(
                    onGoogleSignInPressed: () =>
                        _onGoogleSignInPressed(context),
                    onAppleSignInPressed: () {},
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LoginWidgetsBody(),
                LoginButtons(
                  onGoogleSignInPressed: () => _onGoogleSignInPressed(context),
                  onAppleSignInPressed: () {},
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _onGoogleSignInPressed(BuildContext context) {
    context.read<AuthBloc>().add(SignInWithGoogleEvent());
  }
}
