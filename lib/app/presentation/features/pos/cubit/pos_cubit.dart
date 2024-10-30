// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/branch_karat_rate_model.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/sales_person_response_model.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';

part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  final ServiceLocator _serviceLocator;
  PosCubit(this._serviceLocator) : super(PosInitial()) {
    _init();
  }

  late final FocusNode focusNode;
  late final FocusNode focufsNode;

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

  //
  late final TextEditingController remarks;

  late List<KaratRateResponse> _karatRate;
  late List<SalesPersons> _salesPersonsResponse;

  void _init() {
    focusNode = FocusNode();
    focufsNode = FocusNode();
    voucherName = TextEditingController(text: 'POS');
    voucherNo = TextEditingController(text: '1');
    currency = TextEditingController(text: 'AED');
    currencyRate = TextEditingController(text: '1.000000');
    _salesPersonsList = [];
    voucherDate = '';
    salesPerson = '';
    customerMobile = TextEditingController();
    customerName = TextEditingController();
    customerCode = TextEditingController();
    idType = TextEditingController();
    customerId = TextEditingController();
    expireyDate = '';
    remarks = TextEditingController();
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

  emitState() {
    emit(PosInitial());
    emit(PosLoaded(karatRate: _karatRate, salesPersonsList: _salesPersonsList));
  }
}
