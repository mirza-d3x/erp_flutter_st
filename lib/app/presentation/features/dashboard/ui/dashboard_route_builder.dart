import 'package:erp_mobile/app/presentation/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:erp_mobile/app/presentation/features/dashboard/ui/dashboard_screen.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreenRouteBuilder {
  final ServiceLocator _serviceLocator;

  DashboardScreenRouteBuilder(this._serviceLocator);
  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(_serviceLocator),
      child: const DashboardScreen(),
    );
  }
}
