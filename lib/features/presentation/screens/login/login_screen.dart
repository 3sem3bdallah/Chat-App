import 'widgets/auth_login_button.dart';
import 'widgets/providers_sign_in.dart';

import 'widgets/dont_have_account_text.dart';
import 'widgets/forget_password.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/auth_header.dart';
import '../../../../utils/extinsion/spacing.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.email, this.pass});

  final String? email;
  final String? pass;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? pass;

  @override
  void initState() {
    super.initState();
    email = widget.email;
    pass = widget.pass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AuthHeader(title: 'Login'),
            AppTextFormField(
              hintText: "Email",
              onchange: (data) {
                setState(() {
                  email = data;
                });
              },
            ),
            verticalSpace(5),
            AppTextFormField(
              hintText: "Password",
              obscureText: true,
              onchange: (data) {
                setState(() {
                  pass = data;
                });
              },
            ),
            ForgetPassword(),
            verticalSpace(35),
            ProvidersSinIn(
              // TODO: integrate with google/ apple
            ),
            verticalSpace(55),
            AuthLoginButton(email: email, password: pass),
            verticalSpace(15),
            DontHaveAccountText(),
          ],
        ),
      ),
    );
  }
}
