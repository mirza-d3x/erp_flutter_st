import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/widgets/snackbar/custom_snackbar.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ServiceLocator _serviceLocator;
  late final FocusNode userNameFocusNode;
  late final FocusNode passwordFocusNode;

  LoginCubit(this._serviceLocator)
      : super(const LoginInitial(
            isPasswordFieldEnabled: false,
            isPasswordVerified: false,
            isPasswordVerifyEnabled: false,
            isUserNameVerifyEnabled: false,
            selectedBranches: '',
            branches: [],
            financialYears: [],
            selectedFinancialYeaers: '')) {
    _init();
  }

  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController branchController;
  late final TextEditingController yearController;

  bool _isUserNameVerifyEnabled = false;
  bool _isPasswordFieldEnabled = false;
  bool _isPasswordVerifyEnabled = false;
  bool _isPasswordVerified = false;

  String _selectedBranch = '';
  String _selectedYears = '';
  final List<String> _userBranches = [];
  final List<String> _financialYears = [];

  void _init() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    branchController = TextEditingController();
    yearController = TextEditingController();

    // Initialize FocusNodes
    userNameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    // Add listeners to FocusNodes
    userNameFocusNode.addListener(() {
      if (!userNameFocusNode.hasFocus) {
        // Call verification when username field loses focus
        onVerifyUsername();
      }
    });

    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        // Call verification when password field loses focus
        onVerifyPassword();
      }
    });
  }

  void onUserNameChanged(String value) {
    if (value.length >= 3) {
      _isUserNameVerifyEnabled = true;
      emitState();
    }
  }

  void onPasswordChanged(String value) {
    if (value.length >= 3) {
      _isPasswordVerifyEnabled = true;
      emitState();
    }
  }

  void onSignin(BuildContext context) async {
    final verifyUser = await _serviceLocator.apiService
        .sendBranchMasterRequest(branchName: _selectedBranch);

    if (verifyUser.status == 'Success') {
      _serviceLocator.navigationService.openDashboardPageRoute(context);
    } else {
      showCustomSnackbar(context, verifyUser.message);
    }
  }

  void onVerifyUsername() async {
    final verifyUser = await _serviceLocator.apiService
        .sendVerifyUserRequest(userName: userNameController.text.trim());

    if (verifyUser.status == 'Success') {
      _isPasswordFieldEnabled = true;
    } else {
      // You can handle errors by emitting states with error messages
      emit(LoginErrorState(verifyUser.message));
    }
    emitState();
  }

  void onVerifyPassword() async {
    final verifyUser = await _serviceLocator.apiService
        .sendVerifyPasswordRequest(
            userName: userNameController.text.trim(),
            password: passwordController.text.trim());

    if (verifyUser.status == 'Success') {
      _isPasswordVerified = true;
      await getUserBranches();
    } else {}
    emitState();
  }

  Future getUserBranches() async {
    final verifyUser = await _serviceLocator.apiService
        .sendUserBranchesRequest(userName: userNameController.text.trim());

    if (verifyUser.status == 'Success') {
      if (verifyUser.responseList != null) {
        _userBranches.addAll(verifyUser.responseList!.map(
          (e) => e.branchCode,
        ));
        _selectedBranch = _userBranches.first;
        await getFinancialYears();
      }
    } else {
      emit(LoginErrorState(verifyUser.message));
    }
    emitState();
  }

  Future getFinancialYears() async {
    final verifyUser = await _serviceLocator.apiService
        .sendFinancialYearRequest(
            userName: userNameController.text.trim(), branch: _selectedBranch);

    if (verifyUser.status == 'Success') {
      if (verifyUser.responseList != null) {
        _financialYears.addAll(verifyUser.responseList!.map(
          (e) => e.fyearcode,
        ));
        _selectedYears = _financialYears.first;
      }
    } else {
      emit(LoginErrorState(verifyUser.message));
    }
    emitState();
  }

  void selectBranch(String? branch) {
    _selectedBranch = branch ?? _selectedBranch;
    emitState();
  }

  void selectYear(String? year) {
    _selectedYears = year ?? _selectedYears;
    emitState();
  }

  emitState() {
    emit(LoginTemp());
    emit(
      LoginInitial(
          isPasswordFieldEnabled: _isPasswordFieldEnabled,
          isPasswordVerified: _isPasswordVerified,
          isPasswordVerifyEnabled: _isPasswordVerifyEnabled,
          isUserNameVerifyEnabled: _isUserNameVerifyEnabled,
          branches: _userBranches,
          selectedBranches: _selectedBranch,
          financialYears: _financialYears,
          selectedFinancialYeaers: _selectedYears),
    );
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    branchController.dispose();
    yearController.dispose();
    return super.close();
  }
}
