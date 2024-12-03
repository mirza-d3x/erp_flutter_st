class CustomerLookupResponse {
  CustomerLookupResponse({
    required this.message,
    required this.status,
    required this.dynamicData,
  });

  final String message;
  final String status;
  final List<List<DynamicDatum>> dynamicData;

  factory CustomerLookupResponse.fromJson(Map<String, dynamic> json) {
    return CustomerLookupResponse(
      message: json["message"] ?? "",
      status: json["status"] ?? "",
      dynamicData: json["dynamicData"] == null
          ? []
          : List<List<DynamicDatum>>.from(json["dynamicData"]!.map((x) =>
              x == null
                  ? []
                  : List<DynamicDatum>.from(
                      x!.map((x) => DynamicDatum.fromJson(x))))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "dynamicData":
            dynamicData.map((x) => x.map((x) => x.toJson()).toList()).toList(),
      };
}

class DynamicDatum {
  DynamicDatum({
    required this.code,
    required this.name,
    required this.mobile,
    required this.tel1,
    required this.email,
    required this.countryCode,
    required this.address,
    required this.count,
  });

  final String code;
  final String name;
  final String mobile;
  final String tel1;
  final String email;
  final String countryCode;
  final String address;
  final num count;

  factory DynamicDatum.fromJson(Map<String, dynamic> json) {
    return DynamicDatum(
      code: json["CODE"] ?? "",
      name: json["NAME"] ?? "",
      mobile: json["MOBILE"] ?? "",
      tel1: json["TEL1"] ?? "",
      email: json["EMAIL"] ?? "",
      countryCode: json["COUNTRY_CODE"] ?? "",
      address: json["ADDRESS"] ?? "",
      count: json["COUNT"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "CODE": code,
        "NAME": name,
        "MOBILE": mobile,
        "TEL1": tel1,
        "EMAIL": email,
        "COUNTRY_CODE": countryCode,
        "ADDRESS": address,
        "COUNT": count,
      };
}
