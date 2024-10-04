part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  final List<ProductModuleResponse> productModuleResponse;

  const DashboardLoaded({required this.productModuleResponse});
}
