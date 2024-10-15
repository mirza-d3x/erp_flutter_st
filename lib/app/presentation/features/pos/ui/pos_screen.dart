import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_datepicker.dart';
import 'package:erp_mobile/app/widgets/custom_dropdown.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:erp_mobile/app/widgets/dashboard_app_bar.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  PosScreenState createState() => PosScreenState();
}

class PosScreenState extends State<PosScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<PosCubit>(context);

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VoucherDetails(cubit: cubit),
                  const SizedBox(height: 10),
                  CustomerDetails(cubit: cubit),
                  const SizedBox(height: 10),
                  LineItemsSection(tabController: _tabController),
                  const SizedBox(height: 10),
                  const ReceiptDetailsSection(),
                  const SizedBox(height: 10),
                  const SalesSummaryPanel(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        text: 'Save',
                        onPressed: () {
                          // Save action
                        },
                      ),
                      const SizedBox(width: 10),
                      CustomElevatedButton(
                        text: 'Cancel',
                        onPressed: () {
                          // Cancel action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VoucherDetails extends StatelessWidget {
  final PosCubit cubit;

  const VoucherDetails({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Voucher Details',
            style: customTextStyle(
              fontStyle: FontStyle.titleSmallSemiBold,
              color: FontColor.fontPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: CustomElevatedButton(
                  text: 'New',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomTextField(
                  controller: cubit.voucherName,
                  labelText: 'Voucher',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: CustomTextField(
                  controller: cubit.voucherNo,
                  labelText: 'Voc.No',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomTextField(
                  controller: cubit.currency,
                  labelText: 'Currency',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomTextField(
                  controller: cubit.currencyRate,
                  labelText: 'Cur.Rate',
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                flex: 2,
                child: CustomDatePicker(labelText: 'Date'),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomDropdownPicker(items: cubit.salesPersonsList),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

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
                    onPressed: () {},
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

// Widget for Line Items Section
class LineItemsSection extends StatelessWidget {
  final TabController tabController;

  const LineItemsSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Line Items',
              style: customTextStyle(
                fontStyle: FontStyle.titleSmallSemiBold,
                color: FontColor.fontPrimary,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          'Sold Item',
                          style: customTextStyle(
                            fontStyle: FontStyle.titleSmallSemiBold,
                            color: FontColor.fontPrimary,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Sales Return',
                          style: customTextStyle(
                            fontStyle: FontStyle.titleSmallSemiBold,
                            color: FontColor.fontPrimary,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Exchange',
                          style: customTextStyle(
                            fontStyle: FontStyle.titleSmallSemiBold,
                            color: FontColor.fontPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        DataTable(
                          columns: _lineItemColumns(),
                          rows: _lineItemRows(),
                        ),
                        const Center(
                          child: Text('Sales Return'),
                        ),
                        const Center(
                          child: Text('Exchange'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Item'),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _lineItemColumns() {
    return [
      const DataColumn(
        label: Text('SL No.'),
      ),
      const DataColumn(
        label: Text('Stock Code'),
      ),
      const DataColumn(
        label: Text('Description'),
      ),
      const DataColumn(
        label: Text('Pcs'),
      ),
      const DataColumn(
        label: Text('Qty'),
      ),
      const DataColumn(
        label: Text('Rate'),
      ),
      const DataColumn(
        label: Text('Tax %'),
      ),
      const DataColumn(
        label: Text('Disc %'),
      ),
      const DataColumn(
        label: Text('Amount'),
      ),
      const DataColumn(
        label: Text('Action'),
      ),
    ];
  }

  List<DataRow> _lineItemRows() {
    return const [
      DataRow(
        cells: [
          DataCell(
            Text('1'),
          ),
          DataCell(
            Text('12345'),
          ),
          DataCell(
            Text('Sample Item'),
          ),
          DataCell(
            Text('1'),
          ),
          DataCell(
            Text('5'),
          ),
          DataCell(
            Text('100'),
          ),
          DataCell(
            Text('5'),
          ),
          DataCell(
            Text('10'),
          ),
          DataCell(
            Text('450'),
          ),
          DataCell(
            Icon(Icons.delete),
          ),
        ],
      ),
    ];
  }
}

class ReceiptDetailsSection extends StatelessWidget {
  const ReceiptDetailsSection({super.key});

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
                  ),
                ),
                Text(
                  '\$500',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
                  ),
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
                  ),
                ),
                Text(
                  '\$50',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
                  ),
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
                  ),
                ),
                Text(
                  '\$20',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
                  ),
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
                  ),
                ),
                Text(
                  '\$530',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
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
                  ),
                ),
                Text(
                  '10',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
                  ),
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
                  ),
                ),
                Text(
                  '50',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
                  ),
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
                  ),
                ),
                Text(
                  '\$150',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
                  ),
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
                  ),
                ),
                Text(
                  '\$1000',
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyMregular,
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
