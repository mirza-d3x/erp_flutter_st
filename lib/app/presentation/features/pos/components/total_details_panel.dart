import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class TotalDetailsPanel extends StatelessWidget {
  const TotalDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      width: size.width / 4,
      color: customColors().backgroundPrimary,
      child: Column(
        children: [
          TotalDetailsTile(
            label: 'Item Total',
            value: '0.00',
            cardColor: customColors().grey100,
            labelColor: customColors().fontPrimary,
          ),
          TotalDetailsTile(
            label: 'Tax Amount',
            value: '0.00',
            cardColor: customColors().grey100,
            labelColor: customColors().fontPrimary,
          ),
          TotalDetailsTile(
            label: 'Gross Total',
            value: '0.00',
            cardColor: customColors().grey100,
            labelColor: customColors().fontPrimary,
          ),
          TotalDetailsTile(
            label: 'Sales Return',
            value: '0.00',
            cardColor: customColors().grey500,
            labelColor: customColors().backgroundPrimary,
          ),
          TotalDetailsTile(
            label: 'Exchange',
            value: '0.00',
            cardColor: customColors().grey500,
            labelColor: customColors().backgroundPrimary,
          ),
          TotalDetailsTile(
            label: 'Roundoff Discount',
            value: '0.00',
            cardColor: customColors().dodgerBlue,
            labelColor: customColors().backgroundPrimary,
          ),
          TotalDetailsTile(
            label: 'Net Amount',
            value: '0.00',
            cardColor: customColors().dodgerBlue,
            labelColor: customColors().backgroundPrimary,
          ),
          TotalDetailsTile(
            label: 'Receipt Total',
            value: '0.00',
            cardColor: customColors().dodgerBlue,
            labelColor: customColors().backgroundPrimary,
          ),
          TotalDetailsTile(
            label: 'VAT Round Off',
            value: '0.00',
            cardColor: customColors().dodgerBlue,
            labelColor: customColors().backgroundPrimary,
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Remarks',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.save,
                    label: 'Save Bill',
                    onPressed: () {
                      // Save Bill logic
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.save_alt,
                    label: 'Continue',
                    onPressed: () {
                      // Save and Continue logic
                    },
                  ),
                ],
              ),
              _buildActionButton(
                icon: Icons.cancel,
                label: 'Cancel Bill',
                onPressed: () {
                  // Cancel Bill logic
                },
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required String label,
      required VoidCallback onPressed,
      Color? color}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: color ?? customColors().bluePrimary,
      ),
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}

class TotalDetailsTile extends StatelessWidget {
  const TotalDetailsTile(
      {super.key,
      this.style,
      required this.label,
      required this.value,
      this.labelColor,
      this.cardColor});
  final TextStyle? style;
  final String label;
  final String value;
  final Color? labelColor;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: cardColor ?? customColors().grey300,
                border: Border.all(
                  color: customColors().fontPrimary,
                ),
              ),
              child: Text(
                label,
                style: style ??
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: labelColor ?? customColors().fontPrimary,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
