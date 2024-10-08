// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/services/service_locator.dart';

part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  final ServiceLocator _serviceLocator;
  PosCubit(this._serviceLocator) : super(PosInitial());
}
