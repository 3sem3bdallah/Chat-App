import 'dart:developer';

import 'package:chat_app/features/presentation/widgets/app_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLoginButton extends StatefulWidget {
  const AuthLoginButton({super.key, this.email, this.password});
  final String? email;
  final String? password;

  @override
  State<AuthLoginButton> createState() => _AuthLoginButtonState();
}

class _AuthLoginButtonState extends State<AuthLoginButton> {
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: "Sign in",
      textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
      onPressed: () async {
        if (widget.email == null || widget.password == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please Write Email and Password")),
          );
          return;
        }

        final errorMessage = await _loginUser();

        if (!context.mounted) return;

        if (errorMessage == null) {
          // success
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login successfully")));

          Navigator.pushReplacementNamed(context, 'Home');
        } else {
          // show exact Firebase error
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
    );
  }

  Future<String?> _loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.email!,
        password: widget.password!,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'invalid-email':
          message = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          message = 'This user has been disabled.';
          break;
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided for that user.';
          break;
        case 'too-many-requests':
          message = 'Too many attempts. Try again later.';
          break;
        case 'operation-not-allowed':
          message = 'Signing in with Email & Password is not enabled.';
          break;
        default:
          message = e.message ?? 'Authentication error: ${e.code}';
      }
      return message;
    } catch (error) {
      log(error.toString());
      return "Unexpected error: ${error.toString()}";
    }
  }
}
