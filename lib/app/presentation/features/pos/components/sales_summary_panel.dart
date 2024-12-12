import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class SalesSummaryPanel extends StatelessWidget {
  const SalesSummaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
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
                  'Total Items:',
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyMregular,
                      color: FontColor.fontPrimary),
                ),
                Text(
                  '0.0',
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
                  'Total Quantity:',
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
                  'Total Tax:',
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
                  'Grand Total:',
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
