import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/theme/styles.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;

  const CustomSnackbar({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: grey700,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33111928),
            blurRadius: 4,
            offset: Offset(0, 2.8),
          )
        ],
      ),
      child: Text(
        message,
        style: customTextStyle(
          fontStyle: FontStyle.bodyLregular,
          color: FontColor.grey200,
        ),
      ),
    );
  }
}

void showCustomSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    width: 361.w,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: CustomSnackbar(message: message),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
