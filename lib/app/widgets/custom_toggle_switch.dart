import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/theme/styles.dart';

class CustomToggleSwitch extends StatefulWidget {
  final bool isActive;
  final ValueChanged<bool> onToggle;

  const CustomToggleSwitch({
    required this.isActive,
    required this.onToggle,
    super.key,
  });

  @override
  CustomToggleSwitchState createState() => CustomToggleSwitchState();
}

class CustomToggleSwitchState extends State<CustomToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onToggle(!widget.isActive);
      },
      child: Container(
        width: 52.w,
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.h),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              color: Color(0xFF4B5563),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment:
              widget.isActive ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24.sp,
            height: 24.sp,
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              color: customColors().grey900,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: customColors().grey600,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
