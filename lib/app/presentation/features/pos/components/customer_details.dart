import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_datepicker.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatelessWidget {
  final PosCubit cubit;

  const CustomerDetails({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Details',
              style: customTextStyle(
                fontStyle: FontStyle.titleSmallSemiBold,
                color: FontColor.fontPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    controller: cubit.customerMobile,
                    labelText: 'Mobile Number',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    controller: cubit.customerName,
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    controller: cubit.customerCode,
                    labelText: 'Code',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    controller: cubit.idType,
                    labelText: 'ID Type',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    controller: cubit.customerId,
                    labelText: 'ID',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomElevatedButton(
                    onPressed: () {
                      cubit.onAddCustomer(context);
                    },
                    text: 'Add Customer',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 150,
                  child: CustomDatePicker(labelText: 'Expiry Date'),
                ),
                Expanded(
                  flex: 1,
                  child: CheckboxListTile(
                    title: const Text('Tourist VAT Refund Ref #'),
                    value: false,
                    onChanged: (val) {},
                    controlAffinity: ListTileControlAffinity.platform,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      CustomElevatedButton(
                        onPressed: () {},
                        text: 'Import Sales Estimation',
                      ),
                      const SizedBox(width: 10),
                      CustomElevatedButton(
                        onPressed: () {},
                        text: 'Import Sales Order',
                      ),
                      const SizedBox(width: 10),
                      CustomElevatedButton(
                        onPressed: () {},
                        text: 'Add Attachment',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
