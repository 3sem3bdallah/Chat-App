import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello, still work in it\nCome back later",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.sp),
        ),
      ),
    );
  }
}
