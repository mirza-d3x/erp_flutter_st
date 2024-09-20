import 'package:erp_mobile/constants/assets/icon_assets.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon = AssetIcons.backArrow,
    this.onBackPressed,
  });

  final String title;
  final String icon;
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparent,
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(gradient: gradientBackgroundPrimaryAppBar),
      ),
      leading: IconButton(
        icon: Image.asset(
          icon,
          height: 28.sp,
          width: 28.sp,
        ),
        onPressed: onBackPressed,
      ),
      title: Text(
        title,
        style: customTextStyle(
          fontStyle: FontStyle.headLineSmall,
          color: FontColor.grey900,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
