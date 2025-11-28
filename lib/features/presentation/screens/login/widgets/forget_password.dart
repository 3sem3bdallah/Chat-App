import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 12.w, top: 12.h),
          child: InkWell(
            // TODO: do a forget pass logic & Screen
            child: Text(
              "Forget Password",
              style: TextStyle(color: Colors.blueAccent, fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
