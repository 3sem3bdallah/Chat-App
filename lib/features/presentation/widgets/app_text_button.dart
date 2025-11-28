import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 40.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:8.w),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.black,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 16.w,
              vertical: verticalPadding ?? 8.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: textStyle ??
                TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
