import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  final String text;

  const CustomDivider({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: customColors().grey600,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(
            text,
            style: customTextStyle(
              fontStyle: FontStyle.bodySmallSemiBold,
              color: FontColor.grey600,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: customColors().grey600,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
