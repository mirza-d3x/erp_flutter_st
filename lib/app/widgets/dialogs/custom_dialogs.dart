import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

void showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onButtonPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          CustomElevatedButton(
            onPressed: () {
              onButtonPressed();
              Navigator.of(context).pop();
            },
            text: 'OK',
          ),
        ],
      );
    },
  );
}
