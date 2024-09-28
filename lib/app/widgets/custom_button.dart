import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.buttonColor = primaryBlueButton,
    this.isLoading = false,
    required this.text,
  });

  final void Function()? onPressed;
  final bool isLoading;
  final Color buttonColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              26.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 9.5),
          child: isLoading
              ? const SizedBox(
                  width: 24.0,
                  height: 24,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  text,
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyLBold,
                    color: FontColor.white,
                  ),
                ),
        ),
      ),
    );
  }
}
