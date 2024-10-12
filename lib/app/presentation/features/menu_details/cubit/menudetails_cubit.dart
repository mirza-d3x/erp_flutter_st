import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/services/service_locator.dart';

part 'menudetails_state.dart';

class MenudetailsCubit extends Cubit<MenudetailsState> {
  final ServiceLocator _serviceLocator;
  MenudetailsCubit(this._serviceLocator) : super(MenudetailsInitial());
}
