import 'package:erp_mobile/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../constants/theme/styles.dart';

class CustomGradientScaffold extends StatelessWidget {
  const CustomGradientScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });
  final CustomAppBar appBar;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackgroundPrimary,
        ),
        child: Column(
          children: [
            appBar,
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
