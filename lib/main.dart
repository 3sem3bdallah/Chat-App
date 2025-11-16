import 'package:chat_app/utils/constant/colors.dart';
import 'package:chat_app/view/screens/login/login_screen.dart';
import 'package:chat_app/view/screens/regester/regester_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.background,
            ),
            scaffoldBackgroundColor: AppColors.background,
          ),
          routes: {
            'Login': (context) => LoginScreen(),
            'Regester': (context) => RegesterScreen(),
            // 'Home' : => HomeScreen()
          },
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}
