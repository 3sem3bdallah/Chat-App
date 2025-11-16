import 'package:chat_app/view/screens/login/widgets/dont_have_account_text.dart';
import 'package:chat_app/view/screens/login/widgets/forget_password.dart';
import 'package:chat_app/view/widgets/app_text_button.dart';
import 'package:chat_app/view/widgets/app_text_form_field.dart';
import 'package:chat_app/view/widgets/auth_header.dart';
import 'package:chat_app/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AuthHeader(title: 'Login'),
            AppTextFormField(hintText: "Email"),
            verticalSpace(5),
            AppTextFormField(hintText: "Password", obscureText: true),
            ForgetPassword(),
            Spacer(),
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
