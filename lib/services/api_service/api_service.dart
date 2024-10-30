part of 'service.dart';

abstract interface class ApiServices {
  Future<VerifyUser> sendVerifyUserRequest({required String userName});
  Future<VerifyUser> sendVerifyPasswordRequest(
      {required String userName, required String password});
  Future<VerifyUser> sendUserBranchesRequest({required String userName});
  Future<VerifyUser> sendFinancialYearRequest(
      {required String userName, required String branch});

  Future<VerifyUser> sendBranchMasterRequest({required String branchName});
  Future<ProductModulesModel> sendProductModuleModelRequest();
  Future<List<ModuleResponse>> sendMenuModuleRequest(
      {required String userName, required String branch});
  Future<List<KaratRateResponse>> sendBranchKaratRateRequest(
      {required String branchName});
  Future<List<SalesPersons>> sendSalesPersonRequet({required String branch});
}
