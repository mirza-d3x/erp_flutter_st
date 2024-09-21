import 'package:erp_mobile/app/presentation/features/login/cubit/login_cubit.dart';
import 'package:erp_mobile/app/presentation/features/login/ui/login_screen.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenRouteBuilder {
  final ServiceLocator _serviceLocator;

  LoginScreenRouteBuilder(this._serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(_serviceLocator),
      child: const LoginScreen(),
    );
  }
}
