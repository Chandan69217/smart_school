import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final double? radius;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  CustomTextFieldForm({
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.radius,
    this.controller,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator, // Supports form validation
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: prefixIcon,
        labelStyle: TextStyle(
          height: 1.1,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 12, // Increased padding for better alignment
        ),
        suffixIcon: suffixIcon,
        errorMaxLines: 2, // Prevents text overflow when errors appear
      ),
    );
  }
}

