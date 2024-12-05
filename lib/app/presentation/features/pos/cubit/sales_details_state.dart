part of 'sales_details_cubit.dart';

sealed class SalesDetailsState extends Equatable {
  const SalesDetailsState();

  @override
  List<Object> get props => [];
}

final class SalesDetailsInitial extends SalesDetailsState {}
final class SalesDetailsLoaded extends SalesDetailsState {}
