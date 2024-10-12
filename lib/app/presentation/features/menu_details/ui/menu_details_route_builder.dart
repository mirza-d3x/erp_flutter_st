import 'package:erp_mobile/app/presentation/features/menu_details/cubit/menudetails_cubit.dart';
import 'package:erp_mobile/app/presentation/features/menu_details/ui/menu_details_screen.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDetailsRouteBuilder {
  final ServiceLocator _serviceLocator;

  MenuDetailsRouteBuilder(this._serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => MenudetailsCubit(_serviceLocator),
      child: const MenuDetailsScreen(),
    );
  }
}
