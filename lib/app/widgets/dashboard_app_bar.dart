import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key, this.withDrawer = false, this.onDrawer});
  final bool withDrawer;
  final Function()? onDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(
            Icons.grid_view,
            size: 28,
            color: customColors().backgroundPrimary,
          ),
          const SizedBox(width: 8),
          Text(
            'SUNFACET 2.0',
            style: customTextStyle(
                fontStyle: FontStyle.headLineSmall, color: FontColor.white),
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Management',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Operational',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sales',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Support',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        withDrawer
            ? IconButton(
                onPressed: onDrawer,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
