import 'package:flutter/material.dart';

import '../../../../utils/extinsion/spacing.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/auth_header.dart';
import 'widgets/auth_register_button.dart';
import 'widgets/have_account_text.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({super.key, this.email, this.pass});

  final String? email;
  final String? pass;

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
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
            AuthHeader(title: 'Register'),
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
            verticalSpace(5),
            AppTextFormField(
              hintText: "Retype Password",
              obscureText: true,
              helpText: 'try make it not useless',
            ),
            Spacer(),
            RegisterButton(email: email, password: pass),
            verticalSpace(15),
            HaveAccountText(),
          ],
        ),
      ),
    );
  }
}
