import 'package:chatbox_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String? Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor2, width: 1.0),
        ),
        labelText: label,
        iconColor: AppColors.primaryColor2,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor2, width: 1.0),
        ),
        suffixIcon: suffixIcon,
      ),
      onSaved: onSaved,
    );
  }
}
