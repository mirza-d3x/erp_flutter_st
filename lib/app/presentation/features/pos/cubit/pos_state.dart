part of 'pos_cubit.dart';

sealed class PosState extends Equatable {
  const PosState();

  @override
  List<Object> get props => [];
}

final class PosInitial extends PosState {}

final class PosLoaded extends PosState {
  final List<KaratRateResponse> karatRate;
  final List<String> salesPersonsList;

  const PosLoaded({required this.karatRate, required this.salesPersonsList});
}
