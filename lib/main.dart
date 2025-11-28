import 'utils/constant/colors.dart';
import 'view/screens/login/login_screen.dart';
import 'view/screens/regester/regester_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
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