import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Do you have an account?',
            style: TextStyle(fontSize: 14.sp, color: Colors.black),
          ),
          TextSpan(
            text: ' Login',
            style: TextStyle(fontSize: 14.sp, color: Colors.blueAccent),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, 'Login');
              },
          ),
        ],
      ),
    );
  }
}
