part of 'customer_details_cubit_cubit.dart';

sealed class CustomerDetailsCubitState extends Equatable {
  const CustomerDetailsCubitState();

  @override
  List<Object> get props => [];
}

final class CustomerDetailsCubitInitial extends CustomerDetailsCubitState {}
