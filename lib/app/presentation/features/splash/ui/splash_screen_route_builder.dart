import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/service_locator.dart';
import '../cubit/splash_cubit.dart';
import 'splash_screen.dart';

class SplashScreenRouteBuilder {
  SplashScreenRouteBuilder(this._serviceLocator);
  final ServiceLocator _serviceLocator;
  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(_serviceLocator),
      child: const SplashScreen(),
    );
  }
}
