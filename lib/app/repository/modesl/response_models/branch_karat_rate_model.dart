class BranchKaratRate {
  BranchKaratRate({
    required this.status,
    required this.message,
    required this.response,
  });

  final String status;
  final String message;
  final List<KaratRateResponse> response;

  factory BranchKaratRate.fromJson(Map<String, dynamic> json) {
    return BranchKaratRate(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      response: json["response"] == null
          ? []
          : List<KaratRateResponse>.from(
              json["response"]!.map((x) => KaratRateResponse.fromJson(x))),
    );
  }
}

class KaratRateResponse {
  KaratRateResponse({
    required this.branchCode,
    required this.karatCode,
    required this.karatRate,
    required this.isdefault,
    required this.popkaratRate,
    required this.wskaratRate,
    required this.showinweb,
  });

  final String branchCode;
  final String karatCode;
  final num karatRate;
  final bool isdefault;
  final num popkaratRate;
  final num wskaratRate;
  final bool showinweb;

  factory KaratRateResponse.fromJson(Map<String, dynamic> json) {
    return KaratRateResponse(
      branchCode: json["BRANCH_CODE"] ?? "",
      karatCode: json["KARAT_CODE"] ?? "",
      karatRate: json["KARAT_RATE"] ?? 0.0,
      isdefault: json["ISDEFAULT"] ?? false,
      popkaratRate: json["POPKARAT_RATE"] ?? 0.0,
      wskaratRate: json["WSKARAT_RATE"] ?? 0.0,
      showinweb: json["SHOWINWEB"] ?? false,
    );
  }
}
