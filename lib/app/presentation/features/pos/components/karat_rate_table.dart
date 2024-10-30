import 'package:erp_mobile/app/repository/modesl/response_models/branch_karat_rate_model.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class KaratRateTable extends StatelessWidget {
  final List<KaratRateResponse> karatRates;

  const KaratRateTable({required this.karatRates, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: customColors().backgroundPrimary,
      child: DataTable(
        border: TableBorder.all(),
        columns: const [
          DataColumn(label: Text('Karat')),
          DataColumn(label: Text('Sale')),
          DataColumn(label: Text('Purchase')),
        ],
        rows: karatRates.map((rate) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  rate.karatCode,
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyLarge, color: FontColor.grey900),
                ),
              ),
              DataCell(
                Text(
                  rate.karatRate.toStringAsFixed(2),
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyLBold, color: FontColor.grey900),
                ),
              ),
              DataCell(
                Text(
                  rate.popkaratRate.toStringAsFixed(2),
                  style: customTextStyle(
                      fontStyle: FontStyle.bodyLarge, color: FontColor.grey900),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
