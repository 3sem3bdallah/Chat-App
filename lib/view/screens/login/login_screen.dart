import 'widgets/dont_have_account_text.dart';
import 'widgets/forget_password.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/spacing.dart';
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
