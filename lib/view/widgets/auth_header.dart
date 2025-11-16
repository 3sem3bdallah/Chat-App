import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/view/widgets/spacing.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(5),
        Image.asset("assets/img/conversation.png", height: 80.sp),
        Text(
          "Scholar Chat",
          style: TextStyle(
            fontSize: 32.sp,
            color: Colors.black,
            fontFamily: "pacifico",
          ),
        ),
        verticalSpace(55),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
