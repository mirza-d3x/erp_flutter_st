part of 'service.dart';

class ApiController implements ApiServices {
  final String _baseUrl;

  factory ApiController(String url) => ApiController._private(url);

  ApiController._private(this._baseUrl) {
    _init();
  }

  late final http.Client _client;

  void _init() {
    _client = http.Client();
  }

  @override
  Future<VerifyUser> sendVerifyUserRequest({required String userName}) async {
    try {
      var res = await _client
          .get(Uri.parse(_baseUrl + Endpoints.userDetails + userName));
      consoleLog("Request: $_baseUrl${Endpoints.userDetails}$userName");
      consoleLog("Verify User Response: ${res.body}");
      return VerifyUser.fromJson(_handleResponse(res));
    } catch (error, stackTrace) {
      consoleLog("Error while Verify UserName: $userName",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<VerifyUser> sendVerifyPasswordRequest(
      {required String userName, required String password}) async {
    try {
      var res = await _client.get(Uri.parse(
          '$_baseUrl${Endpoints.validatePassword}strusername=$userName&strPassword=$password'));
      consoleLog(
          "Request: '$_baseUrl${Endpoints.validatePassword}strusername=$userName&strPassword=$password'");
      consoleLog("Verify User Response: ${res.body}");
      return VerifyUser.fromJson(_handleResponse(res));
    } catch (error, stackTrace) {
      consoleLog("Error while Verify UserName: $userName",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<VerifyUser> sendUserBranchesRequest({required String userName}) async {
    try {
      var res = await _client
          .get(Uri.parse(_baseUrl + Endpoints.userBranches + userName));
      consoleLog("Request: $_baseUrl${Endpoints.userBranches}$userName");
      consoleLog("Verify User Branches Response: ${res.body}");
      return VerifyUser.fromJson(_handleResponse(res));
    } catch (error, stackTrace) {
      consoleLog("Error while Sending User branches: $userName",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<VerifyUser> sendFinancialYearRequest(
      {required String userName, required String branch}) async {
    try {
      var res = await _client.get(Uri.parse(
          '$_baseUrl${Endpoints.financialYear}$branch/$userName/$branch'));
      consoleLog(
          "Request:  $_baseUrl${Endpoints.financialYear}$branch/$userName/$branch");
      consoleLog("Verify User Financial Year Response: ${res.body}");
      return VerifyUser.fromJson(_handleResponse(res));
    } catch (error, stackTrace) {
      consoleLog("Error while Financial Years User branches: $userName",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<VerifyUser> sendBranchMasterRequest(
      {required String branchName}) async {
    try {
      var res = await _client
          .get(Uri.parse('$_baseUrl${Endpoints.branchMaster + branchName}'));
      consoleLog("Request: $_baseUrl${Endpoints.branchMaster}$branchName");
      consoleLog("Verify User Branche Master Response: ${res.body}");
      return VerifyUser.fromJson(_handleResponse(res));
    } catch (error, stackTrace) {
      consoleLog("Error while Sending User branche Master: $branchName",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<ProductModulesModel> sendProductModuleModelRequest() async {
    try {
      var res =
          await _client.get(Uri.parse('$_baseUrl${Endpoints.productModules}'));
      consoleLog("Request: $_baseUrl${Endpoints.productModules}");
      consoleLog("Verify User Branche Master Response: ${res.body}");
      return ProductModulesModel.fromJson(_handleResponse(res));
    } catch (error, stackTrace) {
      consoleLog("Error while Sending Product Modules: ",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<ModuleResponse>> sendMenuModuleRequest(
      {required String userName, required String branch}) async {
    try {
      var res = await _client
          .get(Uri.parse('$_baseUrl${'${Endpoints.webMenuModule}ADMIN/HO'}'));
      consoleLog("Request: $_baseUrl${Endpoints.productModules}");
      consoleLog("Menu Module: ${res.body}");
      final response = MenuModule.fromJson(_handleResponse(res));
      return response.response;
    } catch (error, stackTrace) {
      consoleLog("Error while Sending Menu Module: ",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}

Map<String, dynamic> _handleResponse(http.Response response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data: ${response.body}');
  }
}
