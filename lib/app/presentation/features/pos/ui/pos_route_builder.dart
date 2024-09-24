import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/presentation/features/pos/ui/pos_screen.dart';
import 'package:erp_mobile/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PosRouteBuilder {
  final ServiceLocator _serviceLocator;

  PosRouteBuilder(this._serviceLocator);

  Widget call(BuildContext context) {
    return BlocProvider(
      create: (context) => PosCubit(_serviceLocator),
      child: const PosScreen(),
    );
  }
}
