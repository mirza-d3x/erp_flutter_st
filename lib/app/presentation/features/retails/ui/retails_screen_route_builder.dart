import 'package:erp_mobile/app/presentation/features/retails/cubit/retails_cubit.dart';
import 'package:erp_mobile/app/presentation/features/retails/ui/retails_screen.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RetailsScreenRouteBuilder {
  final ServiceLocator _serviceLocator;

  RetailsScreenRouteBuilder(this._serviceLocator);
  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => RetailsCubit(_serviceLocator),
      child: const RetailsScreen(),
    );
  }
}
