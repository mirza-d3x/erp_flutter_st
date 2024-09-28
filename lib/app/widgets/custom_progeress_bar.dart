import 'package:flutter/material.dart';

import '../../constants/theme/styles.dart';

class CustomProgressBar extends StatelessWidget {
  final int activeStep;
  final int totalSteps;

  const CustomProgressBar({
    super.key,
    this.activeStep = 0,
    this.totalSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 14,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: const BoxDecoration(color: transparent),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSteps, (index) {
          return Expanded(
            child: Container(
              height: 6,
              margin: index < totalSteps - 1
                  ? const EdgeInsets.only(right: 8)
                  : null,
              decoration: BoxDecoration(
                color: index < activeStep
                    ? customColors().grey900
                    : customColors().grey300,
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          );
        }),
      ),
    );
  }
}
