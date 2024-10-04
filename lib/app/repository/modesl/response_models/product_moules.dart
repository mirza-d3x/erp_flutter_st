class ProductModulesModel {
  ProductModulesModel({
    required this.message,
    required this.status,
    required this.response,
  });

  final String message;
  final String status;
  final List<ProductModuleResponse> response;

  factory ProductModulesModel.fromJson(Map<String, dynamic> json) {
    return ProductModulesModel(
      message: json["message"] ?? "",
      status: json["status"] ?? "",
      response: json["response"] == null
          ? []
          : List<ProductModuleResponse>.from(
              json["response"]!.map((x) => ProductModuleResponse.fromJson(x))),
    );
  }
}

class ProductModuleResponse {
  ProductModuleResponse({
    required this.mid,
    required this.moduleName,
    required this.moduleCode,
    required this.angCmbPathName,
  });

  final int mid;
  final String moduleName;
  final String moduleCode;
  final String angCmbPathName;

  factory ProductModuleResponse.fromJson(Map<String, dynamic> json) {
    return ProductModuleResponse(
      mid: json["MID"] ?? 0,
      moduleName: json["MODULE_NAME"] ?? "",
      moduleCode: json["MODULE_CODE"] ?? "",
      angCmbPathName: json["ANG_CMB_PATH_NAME"] ?? "",
    );
  }
}
