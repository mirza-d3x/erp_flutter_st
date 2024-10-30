class SalesPersonResponse {
  SalesPersonResponse({
    required this.status,
    required this.message,
    required this.response,
  });

  final String status;
  final String message;
  final List<SalesPersons> response;

  factory SalesPersonResponse.fromJson(Map<String, dynamic> json) {
    return SalesPersonResponse(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      response: json["response"] == null
          ? []
          : List<SalesPersons>.from(
              json["response"]!.map((x) => SalesPersons.fromJson(x))),
    );
  }
}

class SalesPersons {
  SalesPersons({
    required this.salespersonCode,
    required this.description,
    required this.commission,
    required this.mid,
    required this.salesmanImagePath,
    required this.salesmanImage,
    required this.systemDate,
    required this.spShortname,
    required this.spBranchcode,
    required this.empmstCode,
    required this.active,
    required this.spaccode,
    required this.commissiondia,
  });

  final String salespersonCode;
  final String description;
  final int commission;
  final int mid;
  final String salesmanImagePath;
  final String salesmanImage;
  final DateTime? systemDate;
  final String spShortname;
  final String spBranchcode;
  final String empmstCode;
  final bool active;
  final String spaccode;
  final int commissiondia;

  factory SalesPersons.fromJson(Map<String, dynamic> json) {
    return SalesPersons(
      salespersonCode: json["SALESPERSON_CODE"] ?? "",
      description: json["DESCRIPTION"] ?? "",
      commission: json["COMMISSION"] ?? 0,
      mid: json["MID"] ?? 0,
      salesmanImagePath: json["SALESMAN_IMAGE_PATH"] ?? "",
      salesmanImage: json["SALESMAN_IMAGE"] ?? "",
      systemDate: DateTime.tryParse(json["SYSTEM_DATE"] ?? ""),
      spShortname: json["SP_SHORTNAME"] ?? "",
      spBranchcode: json["SP_BRANCHCODE"] ?? "",
      empmstCode: json["EMPMST_CODE"] ?? "",
      active: json["ACTIVE"] ?? false,
      spaccode: json["SPACCODE"] ?? "",
      commissiondia: json["COMMISSIONDIA"] ?? 0,
    );
  }
}
