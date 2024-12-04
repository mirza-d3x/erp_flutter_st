import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('POS Calculations', () {
    // Helper method for performForwardCalculation
    Map<String, double> performForwardCalculation({
      required double grossWt,
      required double stoneWt,
      required double purity,
      required double metalRate,
      required double stoneRate,
      required double makingAmount,
      required double taxPercent,
    }) {
      print('--- performForwardCalculation ---');
      print(
          'Inputs: grossWt=$grossWt, stoneWt=$stoneWt, purity=$purity, metalRate=$metalRate, stoneRate=$stoneRate, makingAmount=$makingAmount, taxPercent=$taxPercent');

      final netWt = grossWt - stoneWt;
      print('Net Weight (grossWt - stoneWt): $netWt');

      final pureWeight = netWt * purity;
      print('Pure Weight (netWt * purity): $pureWeight');

      final metalAmount = netWt * metalRate;
      print('Metal Amount (netWt * metalRate): $metalAmount');

      final stoneAmount = stoneWt * stoneRate;
      print('Stone Amount (stoneWt * stoneRate): $stoneAmount');

      final totalAmount = metalAmount + stoneAmount + makingAmount;
      print(
          'Total Amount (metalAmount + stoneAmount + makingAmount): $totalAmount');

      final taxAmount = (totalAmount * taxPercent) / 100;
      print('Tax Amount (totalAmount * taxPercent / 100): $taxAmount');

      final netAmount = totalAmount + taxAmount;
      print('Net Amount (totalAmount + taxAmount): $netAmount');

      // Handle NaN and Infinity, and round to 2 decimals
      double safeValue(double value) =>
          value.isFinite ? double.parse(value.toStringAsFixed(2)) : 0.0;

      final result = {
        'netWt': safeValue(netWt),
        'pureWeight': safeValue(pureWeight),
        'metalAmount': safeValue(metalAmount),
        'stoneAmount': safeValue(stoneAmount),
        'totalAmount': safeValue(totalAmount),
        'taxAmount': safeValue(taxAmount),
        'netAmount': safeValue(netAmount),
      };

      print('Final Results: $result');
      print('--- End of performForwardCalculation ---');
      return result;
    }

    // Test cases for performForwardCalculation
    test('Forward Calculation: Valid inputs', () {
      final result = performForwardCalculation(
        grossWt: 100.0,
        stoneWt: 10.0,
        purity: 0.9,
        metalRate: 50.0,
        stoneRate: 20.0,
        makingAmount: 100.0,
        taxPercent: 5.0,
      );

      expect(result['netWt'], 90.0);
      expect(result['pureWeight'], 81.0);
      expect(result['metalAmount'], 4500.0);
      expect(result['stoneAmount'], 200.0);
      expect(result['totalAmount'], 4800.0);
      expect(result['taxAmount'], 240.0);
      expect(result['netAmount'], 5040.0);
    });

    // Helper method for performReverseCalculation
    Map<String, double> performReverseCalculation({
      required String trigger,
      required double grossWt,
      required double netWt,
      required double makingRate,
      required double makingAmount,
      required String makingOn,
    }) {
      print('--- performReverseCalculation ---');
      print(
          'Inputs: trigger=$trigger, grossWt=$grossWt, netWt=$netWt, makingRate=$makingRate, makingAmount=$makingAmount, makingOn=$makingOn');

      double calculatedMakingRate = makingRate;
      double calculatedMakingAmount = makingAmount;

      if (trigger == "makingRate") {
        calculatedMakingAmount =
            (makingOn == 'NET') ? makingRate * netWt : makingRate * grossWt;
        print(
            'Calculated Making Amount (trigger=makingRate): $calculatedMakingAmount');
      } else if (trigger == "makingAmount") {
        calculatedMakingRate =
            (makingOn == 'NET') ? makingAmount / netWt : makingAmount / grossWt;
        log('Calculated Making Rate (trigger=makingAmount): $calculatedMakingRate');
      }

      // Handle NaN and Infinity, and round to 2 decimals
      double safeValue(double value) =>
          value.isFinite ? double.parse(value.toStringAsFixed(2)) : 0.0;

      final result = {
        'makingRate': safeValue(calculatedMakingRate),
        'makingAmount': safeValue(calculatedMakingAmount),
      };

      print('Final Results: $result');
      print('--- End of performReverseCalculation ---');
      return result;
    }

    // Test cases for performReverseCalculation
    test('Reverse Calculation: Valid making rate', () {
      final result = performReverseCalculation(
        trigger: "makingRate",
        grossWt: 100.0,
        netWt: 90.0,
        makingRate: 5.0,
        makingAmount: 0.0,
        makingOn: 'GROSS',
      );

      expect(result['makingAmount'], 500.0);
    });

    test('Reverse Calculation: Valid making amount', () {
      final result = performReverseCalculation(
        trigger: "makingAmount",
        grossWt: 100.0,
        netWt: 90.0,
        makingRate: 0.0,
        makingAmount: 500.0,
        makingOn: 'NET',
      );

      expect(result['makingRate'], 5.56); // Rounded to 2 decimals
    });
  });
}
