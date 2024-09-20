import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.buttonColor = primaryTealButton,
    this.isDefault = true,
    this.isLoading = false,
    required this.text,
  });

  final void Function()? onPressed;
  final bool isLoading;
  final Color buttonColor;
  final bool isDefault;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.0.w,
      height: 40.0.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDefault ? buttonColor : Colors.transparent,
          shadowColor: Colors.transparent,
          side: isDefault
              ? null
              : const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              isDefault ? 26.0.sp : 100.0.sp,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 9.5.h),
          child: isLoading
              ? SizedBox(
                  width: 24.0.w,
                  height: 24.h,
                  child: const CircularProgressIndicator(),
                )
              : Text(
                  text,
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyLBold,
                    color: isDefault ? FontColor.white : FontColor.grey900,
                  ),
                ),
        ),
      ),
    );
  }
}
