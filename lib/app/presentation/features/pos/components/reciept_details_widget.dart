import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class RecieptDetailsWidget extends StatelessWidget {
  const RecieptDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Receipt Details',
              style: customTextStyle(
                fontStyle: FontStyle.titleSmallSemiBold,
                color: FontColor.fontPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
                Text(
                  '0.00',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax:',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
                Text(
                  '0.00',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount:',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
                Text(
                  '0.00',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
                Text(
                  '0.00',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
