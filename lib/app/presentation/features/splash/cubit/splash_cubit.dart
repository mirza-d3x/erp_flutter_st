import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/services/data_store/non_volatile/pref_service/preference_service.dart';
import 'package:erp_mobile/services/data_store/non_volatile/preference_keys.dart';
import 'package:erp_mobile/services/data_store/volatile/user_controller.dart';
import 'package:erp_mobile/utils/console_log.dart';
import 'package:flutter/material.dart';

import '../../../../../services/service_locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._serviceLocator) : super(SplashInitial());

  final ServiceLocator _serviceLocator;
  final PreferenceService _preferenceService = PreferenceService();
  void init(BuildContext context) async {
    final bool userName =
        await _preferenceService.containsKey(PreferenceKeys.userName);
    if (userName) {
      UserController().userName =
          await _preferenceService.get(PreferenceKeys.userName);
      UserController().userBranch =
          await _preferenceService.get(PreferenceKeys.userBranch);
      UserController().groupName =
          await _preferenceService.get(PreferenceKeys.groupName);
      UserController().userYear =
          await _preferenceService.get(PreferenceKeys.userYear);
      if (!context.mounted) return;
      Future.delayed(
        const Duration(seconds: 1),
        () {
          _serviceLocator.navigationService.openDashboardPageRoute(context);
        },
      );
    } else {
      if (!context.mounted) return;
      Future.delayed(
        const Duration(seconds: 1),
        () {
          // Navigate after splash loading

          _serviceLocator.navigationService.openLoginPageRoute(context);
        },
      );
    }
  }

  @override
  Future<void> close() {  
    consoleLog("Splash Cubit closed");
    return super.close();
  }
}
