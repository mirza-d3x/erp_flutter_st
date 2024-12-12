// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/sales_details_dialog.dart';
import 'package:erp_mobile/app/presentation/features/pos/sales_details_cubit/sales_details_cubit.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/branch_karat_rate_model.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/retail_sales_stock_validation_response.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/sales_person_response_model.dart';
import 'package:erp_mobile/app/widgets/dialogs/custom_dialogs.dart';
import 'package:erp_mobile/services/data_store/volatile/user_controller.dart';
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
 

  late List<KaratRateResponse> _karatRate;
  late List<SalesPersons> _salesPersonsResponse;

 

  void _init() {
   
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
  
    _getKarateRateData();

   
  }

  _getKarateRateData() async {
    _karatRate = await _serviceLocator.apiService
        .sendBranchKaratRateRequest(branchName: UserController().userBranch);
    _salesPersonsResponse =
        await _serviceLocator.apiService.sendSalesPersonRequet(branch: UserController().userBranch);
    _salesPersonsList =
        _salesPersonsResponse.map((person) => person.salespersonCode).toList();
    emitState();
  }

 
 

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => SalesDetailsCubit(_serviceLocator,voucherDate),
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
