// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final bool isLoading;
  final bool isDisabled;

  final Color backgroundColor;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.isDisabled = false,
    this.backgroundColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || isDisabled ? () {} : onPressed,
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.r),
          color: isDisabled
              ? backgroundColor.withOpacity(0.5)
              : isLoading
              ? backgroundColor.withOpacity(0.6)
              : backgroundColor,
        ),
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 18.0.w,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
