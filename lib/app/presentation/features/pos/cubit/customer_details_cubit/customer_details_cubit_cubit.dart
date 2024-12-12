import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_details_cubit_state.dart';

class CustomerDetailsCubitCubit extends Cubit<CustomerDetailsCubitState> {
  CustomerDetailsCubitCubit() : super(CustomerDetailsCubitInitial());
}
