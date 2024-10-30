import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class LineItemsTabView extends StatelessWidget {
  final TabController tabController;

  const LineItemsTabView({super.key, required this.tabController});

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
                          rows: const [],
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
}
