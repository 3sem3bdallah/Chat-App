import 'package:chat_app/utils/extinsion/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProvidersSinIn extends StatefulWidget {
  const ProvidersSinIn({super.key});

  @override
  State<ProvidersSinIn> createState() => _ProvidersSinInState();
}

class _ProvidersSinInState extends State<ProvidersSinIn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'or continue with',
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Google Button
              Container(
                width: 65.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/img/google-icon.svg',
                    width: 35.w,
                    height: 35.h,
                  ),
                ),
              ),
              horizontalSpace(30),
              // Apple Button
              Container(
                width: 65.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.apple, size: 70, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
