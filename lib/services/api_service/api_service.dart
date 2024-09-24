part of 'service.dart';

abstract interface class ApiServices {
  Future<VerifyUser> sendVerifyUserRequest({required String userName});
  Future<VerifyUser> sendVerifyPasswordRequest(
      {required String userName, required String password});
  Future<VerifyUser> sendUserBranchesRequest({required String userName});
  Future<VerifyUser> sendFinancialYearRequest(
      {required String userName, required String branch});

  Future<VerifyUser> sendBranchMasterRequest({required String branchName});
}
