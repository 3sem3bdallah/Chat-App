import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black
            )
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blueAccent
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                
              },
          ),
        ],
      ),
    );
  }
}