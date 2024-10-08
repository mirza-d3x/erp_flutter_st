part of 'retails_cubit.dart';

abstract class RetailState extends Equatable {
  const RetailState();

  @override
  List<Object?> get props => [];
}

class RetailsInitial extends RetailState {}

class RetailsLoaded extends RetailState {
  final Map<String, List<String>> retailMenuSubModules;

  const RetailsLoaded(this.retailMenuSubModules);

  @override
  List<Object?> get props => [retailMenuSubModules];
}

class RetaislError extends RetailState {
  final String error;

  const RetaislError(this.error);

  @override
  List<Object?> get props => [error];
}
