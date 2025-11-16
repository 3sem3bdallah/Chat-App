import 'package:chat_app/view/screens/regester/widgets/have_account_text.dart';
import 'package:chat_app/view/widgets/app_text_button.dart';
import 'package:chat_app/view/widgets/app_text_form_field.dart';
import 'package:chat_app/view/widgets/auth_header.dart';
import 'package:chat_app/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegesterScreen extends StatelessWidget {
  const RegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AuthHeader(title: 'Regester'),
            AppTextFormField(hintText: "Email"),
            verticalSpace(5),
            AppTextFormField(hintText: "Password", obscureText: true),
            verticalSpace(5),
            AppTextFormField(
              hintText: "Retype Password",
              obscureText: true,
              helpText: 'try make it not useless',
            ),
            Spacer(),
            AppTextButton(
              buttonText: "Create account",
              textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
              onPressed: () {},
            ),
            verticalSpace(15),
            HaveAccountText(),
          ],
        ),
      ),
    );
  }
}
