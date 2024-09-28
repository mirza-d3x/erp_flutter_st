part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginTemp extends LoginState {}

final class LoginInitial extends LoginState {
  final bool isUserNameVerifyEnabled;
  final bool isPasswordFieldEnabled;
  final bool isPasswordVerifyEnabled;
  final bool isPasswordVerified;
  final List<String> branches;
  final List<String> financialYears;
  final String selectedBranches;
  final String selectedFinancialYeaers;

  const LoginInitial({
    required this.isUserNameVerifyEnabled,
    required this.branches,
    required this.isPasswordFieldEnabled,
    required this.isPasswordVerifyEnabled,
    required this.selectedBranches,
    required this.isPasswordVerified,
    required this.financialYears,
    required this.selectedFinancialYeaers,
  });
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState(this.errorMessage);
}
