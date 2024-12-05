import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/retail_sales_stock_validation_response.dart';
import 'package:erp_mobile/app/widgets/dialogs/custom_dialogs.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';

part 'sales_details_state.dart';

class SalesDetailsCubit extends Cubit<SalesDetailsState> {
  final ServiceLocator _serviceLocator;
  final String vouceherDate;
  SalesDetailsCubit(this._serviceLocator, this.vouceherDate)
      : super(SalesDetailsInitial()) {
    _init();
  }

  late final FocusNode makingAmountFocus;
  late final FocusNode makingRateFocusNode;
  late final FocusNode grossWtFocusNode;
  late final FocusNode netAmountFocusNode;

  late final TextEditingController divisionController;
  late final TextEditingController stockCodeController;
  late final TextEditingController stockDescriptionController;
  late final TextEditingController pcsController;
  late final TextEditingController grossWtController;
  late final TextEditingController stoneWtController;
  late final TextEditingController netWtController;
  late final TextEditingController purityController;
  late final TextEditingController purityWeightController;
  late final TextEditingController metalRateController;
  late final TextEditingController metalAmountController;
  late final TextEditingController stoneRateController;
  late final TextEditingController stoneAmountController;
  late final TextEditingController makingRateController;
  late final TextEditingController makingAmountController;
  late final TextEditingController discountPercentController;
  late final TextEditingController discountAmountController;
  late final TextEditingController totalAmountController;
  late final TextEditingController taxPercentController;
  late final TextEditingController taxAmountController;
  late final TextEditingController netAmountController;
  late final TextEditingController tagDetailsController;
  late final TextEditingController rateController;
  late final TextEditingController amountController;
  //
  late final TextEditingController remarks;

  late RetailSalesStockValidation stockData;

  _init() {
    makingAmountFocus = FocusNode();
    makingRateFocusNode = FocusNode();
    grossWtFocusNode = FocusNode();
    netAmountFocusNode = FocusNode();

    remarks = TextEditingController();

    // Sales Details Field
    divisionController = TextEditingController();
    stockCodeController = TextEditingController();
    stockDescriptionController = TextEditingController();
    pcsController = TextEditingController();
    grossWtController = TextEditingController();
    stoneWtController = TextEditingController();
    netWtController = TextEditingController();
    purityController = TextEditingController();
    purityWeightController = TextEditingController();
    metalRateController = TextEditingController();
    metalAmountController = TextEditingController();
    stoneRateController = TextEditingController();
    stoneAmountController = TextEditingController();
    makingRateController = TextEditingController();
    makingAmountController = TextEditingController();
    discountPercentController = TextEditingController();
    discountAmountController = TextEditingController();
    totalAmountController = TextEditingController();
    taxPercentController = TextEditingController();
    taxAmountController = TextEditingController();
    netAmountController = TextEditingController();
    tagDetailsController = TextEditingController();
    rateController = TextEditingController();
    amountController = TextEditingController();

    // Initialize focus node listeners
    grossWtFocusNode.addListener(() {
      if (!grossWtFocusNode.hasFocus &&
          (num.tryParse(grossWtController.text) ?? 0.0) > 0) {
        performForwardCalculation();
        // makingRateFocusNode.requestFocus();
      }
    });

    makingRateFocusNode.addListener(() {
      if (!makingRateFocusNode.hasFocus &&
          (num.tryParse(makingRateController.text) ?? 0.0) > 0) {
        performReverseCalculation("makingRate");
      }
    });

    makingAmountFocus.addListener(() {
      if (!makingAmountFocus.hasFocus &&
          (num.tryParse(makingAmountController.text) ?? 0.0) > 0 &&
          (num.tryParse(grossWtController.text) ?? 0.0) > 0) {
        performReverseCalculation("makingAmount");
      } else if (makingAmountFocus.hasFocus) {
      } else {
        makingAmountController.clear();
      }
    });

    netAmountFocusNode.addListener(() {
      if (!netAmountFocusNode.hasFocus &&
          (num.tryParse(netAmountController.text) ?? 0.0) > 0) {
        performReverseCalculation("netAmount");
      }
    });
    emitState();
  }

  Future getStockDetails(BuildContext context) async {
    stockData =
        await _serviceLocator.apiService.sendRetailsSalesStockValidationRequest(
      stockCode: stockCodeController.text,
      branch: 'HO',
      voucherType: 'POS',
      voucherDate: vouceherDate,
      user: 'ADMIN',
    );

    if (stockData.resultStatus?.resultType == 'Success' &&
        stockData.resultStatus?.validStock == true) {
      divisionController.text = stockData.stockInfo?.division ?? '0.00';
      stockDescriptionController.text =
          stockData.stockInfo?.description ?? '0.00';
      pcsController.text = stockData.stockInfo?.balancePcs ?? '0.00';
      stoneWtController.text =
          stockData.stockInfo?.stoneWt.toString() ?? '0.00';
      purityController.text = stockData.stockInfo?.purity.toString() ?? '0.00';
      metalRateController.text =
          stockData.stockInfo?.metalRate.toString() ?? '0.00';
      grossWtController.text = '0.00';
      makingRateController.text = '0.00';

      netWtController.text = stockData.stockInfo?.netWt.toString() ?? '0.00';
      purityWeightController.text = '0.00';
      metalAmountController.text = '0.00';
      stoneRateController.text = '0.00';
      stoneAmountController.text = '0.00';
      makingAmountController.text = '0.00';
      totalAmountController.text = '0.00';
      taxPercentController.text = stockData.taxInfo.first.igstPer;
      taxAmountController.text = '0.00';
      netAmountController.text = '0.00';

      grossWtFocusNode.requestFocus();
      emitState();
    } else {
      showCustomAlertDialog(
        context: context,
        title: 'Failed',
        message: 'No stock available',
        onButtonPressed: () {
          stockCodeController.clear();
        },
      );
    }
  }

  void performForwardCalculation() {
    final grossWt = double.tryParse(grossWtController.text) ?? 0.0;
    final stoneWt = double.tryParse(stoneWtController.text) ?? 0.0;
    final purity = double.tryParse(purityController.text) ?? 0.0;
    final metalRate = double.tryParse(metalRateController.text) ?? 0.0;
    final stoneRate = double.tryParse(stoneRateController.text) ?? 0.0;
    final makingAmount = double.tryParse(makingAmountController.text) ?? 0.0;

    // Calculate Net Wt
    final netWt = grossWt - stoneWt;

    // Calculate Pure Weight
    final pureWeight = netWt * purity;

    // Calculate Metal Amount
    final metalAmount = pureWeight * metalRate;

    // Calculate Stone Amount
    final stoneAmount = stoneWt * stoneRate;

    // Calculate Total Amount
    final totalAmount = metalAmount + stoneAmount + makingAmount;

    // Calculate Tax Amount
    final taxPercent = double.tryParse(stockData.taxInfo.first.igstPer) ?? 0.0;
    final taxAmount = (totalAmount * taxPercent) / 100;

    // Calculate Net Amount
    final netAmount = totalAmount + taxAmount;

    // Update UI fields
    netWtController.text = netWt.toStringAsFixed(2);
    purityWeightController.text = pureWeight.toStringAsFixed(2);
    metalAmountController.text = metalAmount.toStringAsFixed(2);
    stoneAmountController.text = stoneAmount.toStringAsFixed(2);
    totalAmountController.text = totalAmount.toStringAsFixed(2);
    taxAmountController.text = taxAmount.toStringAsFixed(2);
    netAmountController.text = netAmount.toStringAsFixed(2);

    emitState();
  }

  void performReverseCalculation(String trigger) {
    final grossWt = double.tryParse(grossWtController.text) ?? 0.0;
    final netWt = double.tryParse(netWtController.text) ?? 0.0;
    final taxPercent = double.tryParse(stockData.taxInfo.first.igstPer) ?? 0.0;
    final makingOn = stockData.stockInfo?.makingOn ?? 'GROSS';

    double makingRate = double.tryParse(makingRateController.text) ?? 0.0;
    double makingAmount = double.tryParse(makingAmountController.text) ?? 0.0;
    double totalAmount = 0.0;
    double taxAmount = 0.0;
    double netAmount = double.tryParse(netAmountController.text) ?? 0.0;

    if (trigger == "netAmount") {
      // Reverse calculate Tax Amount
      taxAmount = ((netAmount * taxPercent) / (100 + taxPercent)).isFinite
          ? ((netAmount * taxPercent) / (100 + taxPercent))
          : 0.0;

      // Reverse calculate Total Amount
      totalAmount =
          (netAmount - taxAmount).isFinite ? (netAmount - taxAmount) : 0.0;

      // Update UI fields
      taxAmountController.text = taxAmount.toStringAsFixed(2);
      totalAmountController.text = totalAmount.toStringAsFixed(2);

      // Recalculate Making Amount and Making Rate
      final metalAmount = double.tryParse(metalAmountController.text) ?? 0.0;
      final stoneAmount = double.tryParse(stoneAmountController.text) ?? 0.0;

      // Calculate Making Amount as the residual after subtracting metal and stone amounts
      makingAmount = totalAmount - metalAmount - stoneAmount;

      // Calculate Making Rate based on Making Amount
      if (grossWt > 0 || netWt > 0) {
        makingRate =
            (makingOn == 'NET' ? makingAmount / netWt : makingAmount / grossWt)
                    .isFinite
                ? (makingOn == 'NET'
                    ? makingAmount / netWt
                    : makingAmount / grossWt)
                : 0.0;
      }

      // Update UI fields for Making Amount and Making Rate
      makingAmountController.text = makingAmount.toStringAsFixed(2);
      makingRateController.text = makingRate.toStringAsFixed(2);

      // Trigger forward calculation to recalculate dependent fields
      performForwardCalculation();
    } else if (trigger == "makingAmount") {
      // Reverse calculate Making Rate from Making Amount
      if (grossWt > 0 || netWt > 0) {
        makingRate =
            (makingOn == 'NET' ? makingAmount / netWt : makingAmount / grossWt)
                    .isFinite
                ? (makingOn == 'NET'
                    ? makingAmount / netWt
                    : makingAmount / grossWt)
                : 0.0;
      }

      // Update Making Rate in UI
      makingRateController.text = makingRate.toStringAsFixed(2);

      // Trigger forward calculation
      performForwardCalculation();
    } else if (trigger == "makingRate") {
      // Reverse calculate Making Amount from Making Rate
      if (grossWt > 0 || netWt > 0) {
        makingAmount = (makingOn == 'NET'
                    ? makingRate * netWt
                    : makingRate * grossWt)
                .isFinite
            ? (makingOn == 'NET' ? makingRate * netWt : makingRate * grossWt)
            : 0.0;
      }

      // Update Making Amount in UI
      makingAmountController.text = makingAmount.toStringAsFixed(2);

      // Trigger forward calculation
      performForwardCalculation();
    }
  }

  emitState() {
    emit(SalesDetailsInitial());
    emit(SalesDetailsLoaded());
  }
}
