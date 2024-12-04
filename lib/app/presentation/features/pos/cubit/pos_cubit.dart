// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/sales_details_dialog.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/branch_karat_rate_model.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/retail_sales_stock_validation_response.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/sales_person_response_model.dart';
import 'package:erp_mobile/app/widgets/dialogs/custom_dialogs.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:erp_mobile/utils/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  final ServiceLocator _serviceLocator;
  PosCubit(this._serviceLocator) : super(PosInitial()) {
    _init();
  }

  late final FocusNode makingAmountFocus;
  late final FocusNode makingRateFocusNode;
  late final FocusNode grossWtFocusNode;
  late final FocusNode netAmountFocusNode;

  // Voucher Details
  late final TextEditingController voucherName;
  late final TextEditingController voucherNo;
  late final TextEditingController currency;
  late final TextEditingController currencyRate;
  late final String voucherDate;
  late final String salesPerson;
  late List<String> _salesPersonsList;

  // Customer Details
  late final TextEditingController customerMobile;
  late final TextEditingController customerName;
  late final TextEditingController customerCode;
  late final TextEditingController idType;
  late final TextEditingController customerId;
  late final String expireyDate;

  // Sales Details Dialog
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
  late TextEditingController makingAmountController;
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

  late List<KaratRateResponse> _karatRate;
  late List<SalesPersons> _salesPersonsResponse;

  late RetailSalesStockValidation stockData;

  void _init() {
    makingAmountFocus = FocusNode();
    makingRateFocusNode = FocusNode();
    grossWtFocusNode = FocusNode();
    netAmountFocusNode = FocusNode();
    voucherName = TextEditingController(text: 'POS');
    voucherNo = TextEditingController(text: '1');
    currency = TextEditingController(text: 'AED');
    currencyRate = TextEditingController(text: '1.000000');
    _salesPersonsList = [];
    voucherDate = DateTime.now().toFormattedString();
    salesPerson = '';
    customerMobile = TextEditingController();
    customerName = TextEditingController();
    customerCode = TextEditingController();
    idType = TextEditingController();
    customerId = TextEditingController();
    expireyDate = '';
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
    _getKarateRateData();
  }

  _getKarateRateData() async {
    _karatRate = await _serviceLocator.apiService
        .sendBranchKaratRateRequest(branchName: 'HO');
    _salesPersonsResponse =
        await _serviceLocator.apiService.sendSalesPersonRequet(branch: 'HO');
    _salesPersonsList =
        _salesPersonsResponse.map((person) => person.salespersonCode).toList();
    emitState();
  }

  Future getStockDetails(BuildContext context) async {
    stockData =
        await _serviceLocator.apiService.sendRetailsSalesStockValidationRequest(
      stockCode: stockCodeController.text,
      branch: 'HO',
      voucherType: 'POS',
      voucherDate: voucherDate,
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
      // Initialize focus node listeners
      grossWtFocusNode.addListener(() {
        if (!grossWtFocusNode.hasFocus) {
          performForwardCalculation();
          // makingRateFocusNode.requestFocus();
        }
      });

      makingRateFocusNode.addListener(() {
        if (!makingRateFocusNode.hasFocus) {
          performReverseCalculation("makingRate");
        }
      });

      makingAmountFocus.addListener(() {
        if (!makingAmountFocus.hasFocus) {
          performReverseCalculation("makingAmount");
        }
      });

      netAmountFocusNode.addListener(() {
        if (!netAmountFocusNode.hasFocus) {
          performReverseCalculation("netAmount");
        }
      });
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

    // Perform calculations with fallback to 0.0 for invalid results
    final netWt = (grossWt - stoneWt).isFinite ? (grossWt - stoneWt) : 0.0;
    final pureWeight = (netWt * purity).isFinite ? (netWt * purity) : 0.0;
    final metalAmount =
        (netWt * metalRate).isFinite ? (netWt * metalRate) : 0.0;
    final stoneAmount =
        (stoneWt * stoneRate).isFinite ? (stoneWt * stoneRate) : 0.0;
    final totalAmount = (metalAmount + stoneAmount + makingAmount).isFinite
        ? (metalAmount + stoneAmount + makingAmount)
        : 0.0;

    final taxPercent = double.tryParse(stockData.taxInfo.first.igstPer) ?? 0.0;
    final taxAmount = ((totalAmount * taxPercent) / 100).isFinite
        ? ((totalAmount * taxPercent) / 100)
        : 0.0;

    final netAmount =
        (totalAmount + taxAmount).isFinite ? (totalAmount + taxAmount) : 0.0;

    // Bind results to the UI
    grossWtController.text = grossWt.toStringAsFixed(2);
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
    final makingOn = stockData.stockInfo?.makingOn ?? 'GROSS';

    double makingRate = 0.0;
    double makingAmount = 0.0;

    if (trigger == "makingRate") {
      makingRate = double.tryParse(makingRateController.text) ?? 0.0;
      makingAmount =
          (makingOn == 'NET' ? makingRate * netWt : makingRate * grossWt)
                  .isFinite
              ? (makingOn == 'NET' ? makingRate * netWt : makingRate * grossWt)
              : 0.0;
    } else if (trigger == "makingAmount") {
      makingAmount = double.tryParse(makingAmountController.text) ?? 0.0;
      makingRate = (makingOn == 'NET'
                  ? makingAmount / netWt
                  : makingAmount / grossWt)
              .isFinite
          ? (makingOn == 'NET' ? makingAmount / netWt : makingAmount / grossWt)
          : 0.0;
    }

    makingAmountController.text = makingAmount.toStringAsFixed(2);
    makingRateController.text = makingRate.toStringAsFixed(2);

    performForwardCalculation();
  }

  /// Binds calculated data to the UI.
  void bindDataToUI({
    required double grossWt,
    required double netWt,
    required double pureWeight,
    required double metalAmount,
    required double stoneAmount,
    required double makingAmount,
    required double totalAmount,
    required double taxAmount,
    required double netAmount,
  }) {
    grossWtController.text = grossWt.toStringAsFixed(2);
    netWtController.text = netWt.toStringAsFixed(2);
    purityWeightController.text = pureWeight.toStringAsFixed(2);
    metalAmountController.text = metalAmount.toStringAsFixed(2);
    stoneAmountController.text = stoneAmount.toStringAsFixed(2);
    totalAmountController.text = totalAmount.toStringAsFixed(2);
    taxAmountController.text = taxAmount.toStringAsFixed(2);
    netAmountController.text = netAmount.toStringAsFixed(2);

    emitState();
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => PosCubit(_serviceLocator),
          child: const SalesDetailsDialog(),
        );
      },
    );
  }

  emitState() {
    emit(PosInitial());
    emit(PosLoaded(karatRate: _karatRate, salesPersonsList: _salesPersonsList));
  }
}
