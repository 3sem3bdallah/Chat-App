import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/presentation/screens/home/home_screen.dart';
import 'features/presentation/screens/login/login_screen.dart';
import 'features/presentation/screens/regester/regester_screen.dart';
import 'features/presentation/screens/splash/splash_screen.dart';
import 'firebase_options.dart';
import 'utils/constant/colors.dart';

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
            'Splash'  : (context) => SplashScreen(),
            'Login'   : (context) => LoginScreen(),
            'Regester': (context) => RegesterScreen(),
            'Home'    : (context) => HomeScreen()
          },
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}