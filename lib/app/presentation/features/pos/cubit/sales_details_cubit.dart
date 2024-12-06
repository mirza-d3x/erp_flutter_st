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
  late final FocusNode pcsFocusNode;
  late final FocusNode amountFocusNode;
  late final FocusNode discountPercentFocusNode;
  late final FocusNode discountAmountFocusNode;

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

  RetailSalesStockValidation stockData = RetailSalesStockValidation();

  _init() {
    makingAmountFocus = FocusNode();
    makingRateFocusNode = FocusNode();
    grossWtFocusNode = FocusNode();
    netAmountFocusNode = FocusNode();
    pcsFocusNode = FocusNode();
    amountFocusNode = FocusNode();
    discountPercentFocusNode = FocusNode();
    discountAmountFocusNode = FocusNode();
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

    pcsFocusNode.addListener(() {
      if (!pcsFocusNode.hasFocus &&
          (num.tryParse(pcsController.text) ?? 0.0) > 0) {
        performForwardCalculation();
      }
    });

    amountFocusNode.addListener(() {
      if (!amountFocusNode.hasFocus &&
          (num.tryParse(amountController.text) ?? 0.0) > 0) {
        performForwardCalculation();
      }
    });

    discountPercentFocusNode.addListener(() {
      if (!discountPercentFocusNode.hasFocus &&
          (num.tryParse(discountPercentController.text) ?? 0.0) > 0) {
        performReverseCalculation("discountPercent");
      }
    });

    discountAmountFocusNode.addListener(() {
      if (!discountAmountFocusNode.hasFocus &&
          (num.tryParse(discountAmountController.text) ?? 0.0) > 0) {
        performReverseCalculation("discountAmount");
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
      divisionController.text = stockData.stockInfo?.division ?? 'M';
      stockDescriptionController.text = stockData.stockInfo?.description ?? '';
      pcsController.text = stockData.stockInfo?.balancePcs ?? '0.00';
      stoneWtController.text =
          stockData.stockInfo?.stoneWt.toString() ?? '0.00';
      purityController.text = stockData.stockInfo?.purity.toString() ?? '0.00';
      metalRateController.text =
          stockData.stockInfo?.metalRate.toString() ?? '0.00';
      grossWtController.text = '0.00';
      makingRateController.text = '0.00';
      rateController.text = stockData.priceInfo!.sellingPrice.toString();

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
    final rate = double.tryParse(rateController.text) ?? 0.0;
    final pcs = double.tryParse(pcsController.text) ?? 0.0;
    final makingAmount = double.tryParse(makingAmountController.text) ?? 0.0;

    double totalAmount = 0.0;
    double taxAmount = 0.0;
    double netAmount = 0.0;

    if (stockData.stockInfo!.divisionms == 'M') {
      // **Metal Calculation**
      final netWt = grossWt - stoneWt;
      final pureWeight = netWt * purity;
      final metalAmount = pureWeight * metalRate;
      final stoneAmount = stoneWt * rate;

      totalAmount = metalAmount + stoneAmount + makingAmount;

      // Update Metal-specific fields
      netWtController.text = netWt.toStringAsFixed(2);
      purityWeightController.text = pureWeight.toStringAsFixed(2);
      metalAmountController.text = metalAmount.toStringAsFixed(2);
      stoneAmountController.text = stoneAmount.toStringAsFixed(2);
    } else if (stockData.stockInfo!.divisionms == 'S') {
      // **Stone Calculation**
      final amount = rate * pcs;
      final discountPercent =
          double.tryParse(discountPercentController.text) ?? 0.0;
      final discountAmount = discountPercent > 0
          ? (amount * discountPercent) / 100
          : double.tryParse(discountAmountController.text) ?? 0.0;

      totalAmount = amount - discountAmount;

      // Update Stone-specific fields
      amountController.text = amount.toStringAsFixed(2);
      discountAmountController.text = discountAmount.toStringAsFixed(2);
      discountPercentController.text = discountAmount > 0
          ? ((discountAmount / amount) * 100).toStringAsFixed(2)
          : '0.00';
    }

    // **Common Calculation**
    final taxPercent = double.tryParse(taxPercentController.text) ?? 0.0;
    taxAmount = (totalAmount * taxPercent) / 100;
    netAmount = totalAmount + taxAmount;

    // Update Common fields
    totalAmountController.text = totalAmount.toStringAsFixed(2);
    taxAmountController.text = taxAmount.toStringAsFixed(2);
    netAmountController.text = netAmount.toStringAsFixed(2);

    emitState();
  }

  void performReverseCalculation(String trigger) {
    final grossWt = double.tryParse(grossWtController.text) ?? 0.0;
    final netWt = double.tryParse(netWtController.text) ?? 0.0;
    final taxPercent = double.tryParse(taxPercentController.text) ?? 0.0;
    final rate = double.tryParse(rateController.text) ?? 0.0;
    final pcs = double.tryParse(pcsController.text) ?? 0.0;

    double makingAmount = double.tryParse(makingAmountController.text) ?? 0.0;
    double makingRate = double.tryParse(makingRateController.text) ?? 0.0;
    double totalAmount = 0.0;
    double taxAmount = 0.0;
    double netAmount = double.tryParse(netAmountController.text) ?? 0.0;

    if (trigger == "netAmount") {
      // Reverse calculate Tax Amount
      taxAmount = (netAmount * taxPercent) / (100 + taxPercent);
      totalAmount = netAmount - taxAmount;

      // Update Common fields
      taxAmountController.text = taxAmount.toStringAsFixed(2);
      totalAmountController.text = totalAmount.toStringAsFixed(2);

      if (stockData.stockInfo!.divisionms == 'M') {
        // **Metal Reverse Calculation**
        final metalAmount = double.tryParse(metalAmountController.text) ?? 0.0;
        final stoneAmount = double.tryParse(stoneAmountController.text) ?? 0.0;

        makingAmount = totalAmount - metalAmount - stoneAmount;

        if (grossWt > 0 || netWt > 0) {
          makingRate = (stockData.stockInfo?.makingOn ?? 'GROSS') == 'NET'
              ? makingAmount / netWt
              : makingAmount / grossWt;
        }

        makingAmountController.text = makingAmount.toStringAsFixed(2);
        makingRateController.text = makingRate.toStringAsFixed(2);
      } else if (stockData.stockInfo!.divisionms == 'S') {
        // **Stone Reverse Calculation**
        final amount = rate * pcs;
        final discountAmount = amount - totalAmount;
        final discountPercent = (discountAmount / amount) * 100;

        discountAmountController.text = discountAmount.toStringAsFixed(2);
        discountPercentController.text = discountPercent.toStringAsFixed(2);
      }

      performForwardCalculation();
    } else if (trigger == "makingAmount") {
      // Reverse calculate Making Rate from Making Amount
      if (grossWt > 0 || netWt > 0) {
        makingRate = (stockData.stockInfo?.makingOn ?? 'GROSS') == 'NET'
            ? makingAmount / netWt
            : makingAmount / grossWt;
      }

      makingRateController.text = makingRate.toStringAsFixed(2);
      performForwardCalculation();
    } else if (trigger == "makingRate") {
      // Reverse calculate Making Amount from Making Rate
      if (grossWt > 0 || netWt > 0) {
        makingAmount = (stockData.stockInfo?.makingOn ?? 'GROSS') == 'NET'
            ? makingRate * netWt
            : makingRate * grossWt;
      }

      makingAmountController.text = makingAmount.toStringAsFixed(2);
      performForwardCalculation();
    } else if (trigger == "discountPercent") {
      // Reverse calculate Discount Amount from Discount Percent
      final amount = rate * pcs;
      final discountPercent =
          double.tryParse(discountPercentController.text) ?? 0.0;
      final discountAmount = (amount * discountPercent) / 100;

      discountAmountController.text = discountAmount.toStringAsFixed(2);
      totalAmount = amount - discountAmount;

      totalAmountController.text = totalAmount.toStringAsFixed(2);
      performForwardCalculation();
    } else if (trigger == "discountAmount") {
      // Reverse calculate Discount Percent from Discount Amount
      final amount = rate * pcs;
      final discountAmount =
          double.tryParse(discountAmountController.text) ?? 0.0;
      final discountPercent = (discountAmount / amount) * 100;

      discountPercentController.text = discountPercent.toStringAsFixed(2);
      totalAmount = amount - discountAmount;

      totalAmountController.text = totalAmount.toStringAsFixed(2);
      performForwardCalculation();
    }
  }

  emitState() {
    emit(SalesDetailsInitial());
    emit(SalesDetailsLoaded(stockData: stockData));
  }
}
