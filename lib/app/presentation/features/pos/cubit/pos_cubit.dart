// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  late final List<String> salesPersonsList;

  // Customer Details
  late final TextEditingController customerMobile;
  late final TextEditingController customerName;
  late final TextEditingController customerCode;
  late final TextEditingController idType;
  late final TextEditingController customerId;
  late final String expireyDate;

  //
  late final TextEditingController remarks;

  void _init() {
    focusNode = FocusNode();
    focufsNode = FocusNode();
    voucherName = TextEditingController();
    voucherNo = TextEditingController();
    currency = TextEditingController();
    currencyRate = TextEditingController();
    salesPersonsList = ['Sales Person1', 'Sales Person2'];
    voucherDate = '';
    salesPerson = '';
    customerMobile = TextEditingController();
    customerName = TextEditingController();
    customerCode = TextEditingController();
    idType = TextEditingController();
    customerId = TextEditingController();
    expireyDate = '';
    remarks = TextEditingController();
  }
}
