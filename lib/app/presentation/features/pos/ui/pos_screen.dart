import 'package:flutter/material.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('POS Screen')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVoucherDetails(),
              const SizedBox(height: 16.0),
              _buildCustomerDetails(),
              const SizedBox(height: 16.0),
              _buildLineItems(),
              const SizedBox(height: 16.0),
              if (screenWidth > 600)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildRelatedDetailsAndTables()),
                    const SizedBox(width: 16.0),
                    Expanded(flex: 1, child: _buildPriceBreakdownAndActions()),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRelatedDetailsAndTables(),
                    const SizedBox(height: 16.0),
                    _buildPriceBreakdownAndActions(),
                  ],
                ),
              const SizedBox(height: 16.0),
              _buildFooterButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVoucherDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'New',
                  style: TextStyle(color: Colors.black),
                )),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextField(
                label: 'Voucher',
                initialValue: 'POS',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildTextField(
                label: 'Voc No',
                initialValue: '1',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildTextField(
                label: 'Currency',
                initialValue: 'AED',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildTextField(
                label: 'Cur. Rate',
                initialValue: '1.000000',
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildTextField(
                label: 'Sales Person',
                initialValue: '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Mobile Number',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildTextField(
                    label: 'Name',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildTextField(
                    label: 'Code',
                    initialValue: 'gdafs',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                const Text('Tourist VAT Refund Ref #'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'ID Type',
                    // errorText: 'ID Type is required',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: _buildTextField(label: 'ID#')),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Customer',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineItems() {
    return Card(
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.blue,
            controller: _tabController,
            tabs: const [
              Tab(text: 'Sold Item'),
              Tab(text: 'Sales Return'),
              Tab(text: 'Exchange'),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('SL No.'),
                ),
                DataColumn(
                  label: Text('Stock Code'),
                ),
                DataColumn(
                  label: Text('Description'),
                ),
                DataColumn(
                  label: Text('Pcs'),
                ),
                DataColumn(
                  label: Text('Weight'),
                ),
                DataColumn(
                  label: Text('Metal Value'),
                ),
                DataColumn(
                  label: Text('Mkg Amount'),
                ),
                DataColumn(
                  label: Text('Total Amount'),
                ),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(
                    Text('0'),
                  ),
                  DataCell(
                    Text(''),
                  ),
                  DataCell(
                    Text('No data'),
                  ),
                  DataCell(
                    Text(''),
                  ),
                  DataCell(
                    Text(''),
                  ),
                  DataCell(
                    Text('0.00'),
                  ),
                  DataCell(
                    Text('0.00'),
                  ),
                  DataCell(
                    Text('0.00'),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedDetailsAndTables() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Import Sales Estimation',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Import Sales Order',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add Attachment',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Mode')),
              DataColumn(label: Text('Currency')),
              DataColumn(label: Text('Amount LC')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceBreakdownAndActions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
                label: 'Net Total', initialValue: 'AED 0.00', readOnly: true),
            const Divider(),
            _buildPriceField('Item Total', '0.00'),
            _buildPriceField('Tax Amount', '0.00'),
            _buildPriceField('Gross Total', '0.00'),
            _buildPriceField('Less Discount', '0.00'),
            const Divider(),
            _buildPriceField('Net Payable', '0.00'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add Payment',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Print',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Post',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Reprint',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      {required String label,
      String initialValue = '',
      bool readOnly = false,
      String? errorText}) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      decoration: InputDecoration(labelText: label, errorText: errorText),
    );
  }

  Widget _buildPriceField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text('AED $value'),
        ],
      ),
    );
  }
}
