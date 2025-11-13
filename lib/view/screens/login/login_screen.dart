import 'package:chat_app/view/screens/login/widgets/dont_have_account_text.dart';
import 'package:chat_app/view/widgets/app_text_button.dart';
import 'package:chat_app/view/widgets/app_text_form_field.dart';
import 'package:chat_app/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/img/scholar.png"),
            Text(
              "Scholar Chat",
              style: TextStyle(
                fontSize: 32.sp,
                color: Colors.black,
                fontFamily: "pacifico",
              ),
            ),
            verticalSpace(35),
            AppTextFormField(hintText: "Email"),
            verticalSpace(5),
            AppTextFormField(
              hintText: "Password", obscureText: true,
              helpText: 'Fuck this shit',
              ),
            verticalSpace(15),
            AppTextButton(
              buttonText: "Sign in",
              textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
              onPressed: () {},
            ),
            verticalSpace(15),
            DontHaveAccountText(),
          ],
        ),
      ),
    );
  }
}