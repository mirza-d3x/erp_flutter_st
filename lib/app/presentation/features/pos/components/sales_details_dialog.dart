import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SalesDetailsDialog extends StatelessWidget {
  const SalesDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sales Details'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Division',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Stock Code',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Stock Description',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Pcs',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Gross Wt',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Stone Wt',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Net Wt',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Metal Rate',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Metal Amount',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Stone Rate',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Stone Amount',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Rate',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Amount',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Discount %',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Discount Amount',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Total Amount',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 5),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Tax %',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 5),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Tax Amount',
                  controller: TextEditingController(),
                )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: 'Net Amount',
                  controller: TextEditingController(),
                )),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      labelText: 'Tag Details',
                      maxLines: 3,
                      controller: TextEditingController(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Cancel',
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Save',
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Continue',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
