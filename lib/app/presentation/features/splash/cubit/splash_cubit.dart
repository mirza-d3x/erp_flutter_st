import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/utils/console_log.dart';
import 'package:flutter/material.dart';

import '../../../../../services/service_locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._serviceLocator) : super(SplashInitial());

  final ServiceLocator _serviceLocator;

  void init(BuildContext context) async {
    if (!context.mounted) return;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        // Navigate after splash loading
        // _serviceLocator.navigationService.openPosPageRoute(context);
        _serviceLocator.navigationService.openLoginPageRoute(context);
      },
    );
  }

  @override
  Future<void> close() {
    consoleLog("Splash Cubit closed");
    return super.close();
  }
}
