import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ServiceLocator _serviceLocator;
  LoginCubit(this._serviceLocator) : super(LoginInitial()) {
    _init();
  }

  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController branchController;
  late final TextEditingController yearController;

  void _init() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    branchController = TextEditingController();
    yearController = TextEditingController();
  }

  void onSignin() {}

  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    branchController.dispose();
    yearController.dispose();
    return super.close();
  }
}
