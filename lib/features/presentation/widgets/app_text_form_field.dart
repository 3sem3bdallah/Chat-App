import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatefulWidget {
  AppTextFormField({
    this.onchange,
    super.key,
    this.hintText,
    this.helpText,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  });

  Function(String)? onchange;
  final String? hintText;
  final bool obscureText;
  final String? helpText;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // initial state depends on widget.obscureText
    _obscureText = widget.obscureText;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if this field is meant to be obscure (password), show an IconButton that toggles.
    final Widget? suffix = widget.obscureText
        ? IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.remove_red_eye_outlined
                  : Icons.visibility_off_outlined,
            ),
            onPressed: _toggle,
          )
        : widget.suffixIcon;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onchange,
        obscureText: _obscureText,
        decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          suffixIcon: suffix,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black54),
          helperText: widget.helpText,
          helperStyle: TextStyle(fontSize: 12.sp, color: Colors.blueGrey),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
