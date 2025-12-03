import 'dart:developer';
import '../../../widgets/app_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterButton extends StatefulWidget {
  final String? email;
  final String? password;

  const RegisterButton({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: "Register",
      textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
      onPressed: () async {
        if (widget.email == null || widget.password == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please Write Email and Password")),
          );
          return;
        }

        final errorMessage = await _registerUser();

        if (!context.mounted) return;

        if (errorMessage == null) {
          // success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account created successfully")),
          );

          Navigator.pushReplacementNamed(context, 'Login');
        } else {
          // show exact Firebase error
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
    );
  }

  Future<String?> _registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email!,
        password: widget.password!,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password is too weak.';
          break;
        case 'email-already-in-use':
          message = 'An account already exists for that email.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled.';
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
