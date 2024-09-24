class VerifyUser {
  VerifyUser({
    required this.status,
    required this.message,
    this.response, // For a single response
    this.responseList, // For a list of responses
    required this.isListResponse, //
  });

  final String status;
  final String message;
  final UserResponse? response;
  final List<UserResponse>? responseList;
  final bool isListResponse;

  factory VerifyUser.fromJson(Map<String, dynamic> json) {
    bool isListResponse = json["response"].toString().startsWith('[');

    return VerifyUser(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      isListResponse: isListResponse,
      response: !isListResponse
          ? (json["response"] == "************"
              ? null
              : UserResponse.fromJson(json["response"]))
          : null, // For a single response
      responseList: isListResponse
          ? List<UserResponse>.from((json["response"] as List<dynamic>)
              .map((x) => UserResponse.fromJson(x)))
          : null, // For a list response
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "response": response?.toJson(),
      };
}

class UserResponse {
  UserResponse({
    required this.branchCode,
    required this.branchView,
    required this.mid,
    required this.usersname,
    required this.groupName,
    required this.viewConfidentialAcc,
    required this.loginPassword,
    required this.editdeletePassword,
    required this.crlimitPassword,
    required this.editdeleteFlag,
    required this.allowCreditlimit,
    required this.authorizePassword,
    required this.allowAuthorize,
    required this.systemDate,
    required this.blockdiamondcost,
    required this.blockconfidentialac,
    required this.blockdiamondprice2,
    required this.blockmetalcost,
    required this.userLanguage,
    required this.blockpurchasedetails,
    required this.allowlessthancost,
    required this.loginstartyear,
    required this.allowunofficial,
    required this.lessthancostPassword,
    required this.allowroDisc,
    required this.allowroDiscPassword,
    required this.rightpanelinfo,
    required this.allowchangemcunit,
    required this.alloweditpostedvoucher,
    required this.allowtopost,
    required this.blockdocumentdate,
    required this.restrictprintingpassword,
    required this.posDiscCode,
    required this.posDiscOn,
    required this.showAllstock,
    required this.showAllaccount,
    required this.blockDeductMkg,
    required this.allowtofixingrate,
    required this.allowUnlockMaster,
    required this.empmstCode,
    required this.showCurrentbal,
    required this.skipPurityDiff,
    required this.discountauthorization,
    required this.showpoststatus,
    required this.showOnlyAssignedFollowup,
    required this.showautopopupownstock,
    required this.emailId,
    required this.mobileNo,
    required this.closejobSo,
    required this.mtlCostfield,
    required this.diaCostfield,
    required this.allowPayrollauthorize,
    required this.hideemployeesalary,
    required this.authorizeEinvoice,
    required this.allowkycentry,
    required this.allowkycentrypassword,
    required this.showcatalog,
    required this.showdashboard,
    required this.showzoomreports,
    required this.blockprices,
    required this.rfidprintername,
    required this.exportFilePath,
    required this.allowalldatedentries,
    required this.planetterminalid,
    required this.fyearcode,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  final String fyearcode;
  final String startDate;
  final String endDate;
  final String status;
  final String branchCode;
  final bool branchView;
  final int mid;
  final String usersname;
  final String groupName;
  final int viewConfidentialAcc;
  final String loginPassword;
  final String editdeletePassword;
  final String crlimitPassword;
  final bool editdeleteFlag;
  final bool allowCreditlimit;
  final String authorizePassword;
  final bool allowAuthorize;
  final DateTime? systemDate;
  final bool blockdiamondcost;
  final bool blockconfidentialac;
  final bool blockdiamondprice2;
  final bool blockmetalcost;
  final String userLanguage;
  final bool blockpurchasedetails;
  final bool allowlessthancost;
  final String loginstartyear;
  final bool allowunofficial;
  final String lessthancostPassword;
  final bool allowroDisc;
  final String allowroDiscPassword;
  final bool rightpanelinfo;
  final bool allowchangemcunit;
  final bool alloweditpostedvoucher;
  final bool allowtopost;
  final bool blockdocumentdate;
  final String restrictprintingpassword;
  final String posDiscCode;
  final String posDiscOn;
  final bool showAllstock;
  final bool showAllaccount;
  final int blockDeductMkg;
  final bool allowtofixingrate;
  final bool allowUnlockMaster;
  final String empmstCode;
  final bool showCurrentbal;
  final bool skipPurityDiff;
  final bool discountauthorization;
  final bool showpoststatus;
  final bool showOnlyAssignedFollowup;
  final bool showautopopupownstock;
  final String emailId;
  final String mobileNo;
  final bool closejobSo;
  final String mtlCostfield;
  final String diaCostfield;
  final bool allowPayrollauthorize;
  final bool hideemployeesalary;
  final bool authorizeEinvoice;
  final bool allowkycentry;
  final dynamic allowkycentrypassword;
  final bool showcatalog;
  final bool showdashboard;
  final bool showzoomreports;
  final bool blockprices;
  final dynamic rfidprintername;
  final dynamic exportFilePath;
  final bool allowalldatedentries;
  final dynamic planetterminalid;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      mid: json["MID"] ?? 0,
      usersname: json["USERSNAME"] ?? "",
      groupName: json["GROUP_NAME"] ?? "",
      viewConfidentialAcc: json["VIEW_CONFIDENTIAL_ACC"] ?? 0,
      loginPassword: json["LOGIN_PASSWORD"] ?? "",
      editdeletePassword: json["EDITDELETE_PASSWORD"] ?? "",
      crlimitPassword: json["CRLIMIT_PASSWORD"] ?? "",
      editdeleteFlag: json["EDITDELETE_FLAG"] ?? false,
      allowCreditlimit: json["ALLOW_CREDITLIMIT"] ?? false,
      authorizePassword: json["AUTHORIZE_PASSWORD"] ?? "",
      allowAuthorize: json["ALLOW_AUTHORIZE"] ?? false,
      systemDate: DateTime.tryParse(json["SYSTEM_DATE"] ?? ""),
      blockdiamondcost: json["BLOCKDIAMONDCOST"] ?? false,
      blockconfidentialac: json["BLOCKCONFIDENTIALAC"] ?? false,
      blockdiamondprice2: json["BLOCKDIAMONDPRICE2"] ?? false,
      blockmetalcost: json["BLOCKMETALCOST"] ?? false,
      userLanguage: json["USER_LANGUAGE"] ?? "",
      blockpurchasedetails: json["BLOCKPURCHASEDETAILS"] ?? false,
      allowlessthancost: json["ALLOWLESSTHANCOST"] ?? false,
      loginstartyear: json["LOGINSTARTYEAR"] ?? "",
      allowunofficial: json["ALLOWUNOFFICIAL"] ?? false,
      lessthancostPassword: json["LESSTHANCOST_PASSWORD"] ?? "",
      allowroDisc: json["ALLOWRO_DISC"] ?? false,
      allowroDiscPassword: json["ALLOWRO_DISC_PASSWORD"] ?? "",
      rightpanelinfo: json["RIGHTPANELINFO"] ?? false,
      allowchangemcunit: json["ALLOWCHANGEMCUNIT"] ?? false,
      alloweditpostedvoucher: json["ALLOWEDITPOSTEDVOUCHER"] ?? false,
      allowtopost: json["ALLOWTOPOST"] ?? false,
      blockdocumentdate: json["BLOCKDOCUMENTDATE"] ?? false,
      restrictprintingpassword: json["RESTRICTPRINTINGPASSWORD"] ?? "",
      posDiscCode: json["POS_DISC_CODE"] ?? "",
      posDiscOn: json["POS_DISC_ON"] ?? "",
      showAllstock: json["SHOW_ALLSTOCK"] ?? false,
      showAllaccount: json["SHOW_ALLACCOUNT"] ?? false,
      blockDeductMkg: json["BLOCK_DEDUCT_MKG"] ?? 0,
      allowtofixingrate: json["ALLOWTOFIXINGRATE"] ?? false,
      allowUnlockMaster: json["ALLOW_UNLOCK_MASTER"] ?? false,
      empmstCode: json["EMPMST_CODE"] ?? "",
      showCurrentbal: json["SHOW_CURRENTBAL"] ?? false,
      skipPurityDiff: json["SKIP_PURITY_DIFF"] ?? false,
      discountauthorization: json["DISCOUNTAUTHORIZATION"] ?? false,
      showpoststatus: json["SHOWPOSTSTATUS"] ?? false,
      showOnlyAssignedFollowup: json["SHOW_ONLY_ASSIGNED_FOLLOWUP"] ?? false,
      showautopopupownstock: json["SHOWAUTOPOPUPOWNSTOCK"] ?? false,
      emailId: json["EMAIL_ID"] ?? "",
      mobileNo: json["MOBILE_NO"] ?? "",
      closejobSo: json["CLOSEJOB_SO"] ?? false,
      mtlCostfield: json["MTL_COSTFIELD"] ?? "",
      diaCostfield: json["DIA_COSTFIELD"] ?? "",
      allowPayrollauthorize: json["ALLOW_PAYROLLAUTHORIZE"] ?? false,
      hideemployeesalary: json["HIDEEMPLOYEESALARY"] ?? false,
      authorizeEinvoice: json["AUTHORIZE_EINVOICE"] ?? false,
      allowkycentry: json["ALLOWKYCENTRY"] ?? false,
      allowkycentrypassword: json["ALLOWKYCENTRYPASSWORD"],
      showcatalog: json["SHOWCATALOG"] ?? false,
      showdashboard: json["SHOWDASHBOARD"] ?? false,
      showzoomreports: json["SHOWZOOMREPORTS"] ?? false,
      blockprices: json["BLOCKPRICES"] ?? false,
      rfidprintername: json["RFIDPRINTERNAME"],
      exportFilePath: json["EXPORT_FILE_PATH"],
      allowalldatedentries: json["ALLOWALLDATEDENTRIES"] ?? false,
      planetterminalid: json["PLANETTERMINALID"],
      branchCode: json["BRANCH_CODE"] ?? "",
      branchView: json["BRANCH_VIEW"] ?? false,
      fyearcode: json["fyearcode"] ?? "",
      startDate: json["StartDate"] ?? "",
      endDate: json["EndDate"] ?? "",
      status: json["Status"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "BRANCH_CODE": branchCode,
        "BRANCH_VIEW": branchView,
        "MID": mid,
        "USERSNAME": usersname,
        "GROUP_NAME": groupName,
        "VIEW_CONFIDENTIAL_ACC": viewConfidentialAcc,
        "LOGIN_PASSWORD": loginPassword,
        "EDITDELETE_PASSWORD": editdeletePassword,
        "CRLIMIT_PASSWORD": crlimitPassword,
        "EDITDELETE_FLAG": editdeleteFlag,
        "ALLOW_CREDITLIMIT": allowCreditlimit,
        "AUTHORIZE_PASSWORD": authorizePassword,
        "ALLOW_AUTHORIZE": allowAuthorize,
        "SYSTEM_DATE": systemDate?.toIso8601String(),
        "BLOCKDIAMONDCOST": blockdiamondcost,
        "BLOCKCONFIDENTIALAC": blockconfidentialac,
        "BLOCKDIAMONDPRICE2": blockdiamondprice2,
        "BLOCKMETALCOST": blockmetalcost,
        "USER_LANGUAGE": userLanguage,
        "BLOCKPURCHASEDETAILS": blockpurchasedetails,
        "ALLOWLESSTHANCOST": allowlessthancost,
        "LOGINSTARTYEAR": loginstartyear,
        "ALLOWUNOFFICIAL": allowunofficial,
        "LESSTHANCOST_PASSWORD": lessthancostPassword,
        "ALLOWRO_DISC": allowroDisc,
        "ALLOWRO_DISC_PASSWORD": allowroDiscPassword,
        "RIGHTPANELINFO": rightpanelinfo,
        "ALLOWCHANGEMCUNIT": allowchangemcunit,
        "ALLOWEDITPOSTEDVOUCHER": alloweditpostedvoucher,
        "ALLOWTOPOST": allowtopost,
        "BLOCKDOCUMENTDATE": blockdocumentdate,
        "RESTRICTPRINTINGPASSWORD": restrictprintingpassword,
        "POS_DISC_CODE": posDiscCode,
        "POS_DISC_ON": posDiscOn,
        "SHOW_ALLSTOCK": showAllstock,
        "SHOW_ALLACCOUNT": showAllaccount,
        "BLOCK_DEDUCT_MKG": blockDeductMkg,
        "ALLOWTOFIXINGRATE": allowtofixingrate,
        "ALLOW_UNLOCK_MASTER": allowUnlockMaster,
        "EMPMST_CODE": empmstCode,
        "SHOW_CURRENTBAL": showCurrentbal,
        "SKIP_PURITY_DIFF": skipPurityDiff,
        "DISCOUNTAUTHORIZATION": discountauthorization,
        "SHOWPOSTSTATUS": showpoststatus,
        "SHOW_ONLY_ASSIGNED_FOLLOWUP": showOnlyAssignedFollowup,
        "SHOWAUTOPOPUPOWNSTOCK": showautopopupownstock,
        "EMAIL_ID": emailId,
        "MOBILE_NO": mobileNo,
        "CLOSEJOB_SO": closejobSo,
        "MTL_COSTFIELD": mtlCostfield,
        "DIA_COSTFIELD": diaCostfield,
        "ALLOW_PAYROLLAUTHORIZE": allowPayrollauthorize,
        "HIDEEMPLOYEESALARY": hideemployeesalary,
        "AUTHORIZE_EINVOICE": authorizeEinvoice,
        "ALLOWKYCENTRY": allowkycentry,
        "ALLOWKYCENTRYPASSWORD": allowkycentrypassword,
        "SHOWCATALOG": showcatalog,
        "SHOWDASHBOARD": showdashboard,
        "SHOWZOOMREPORTS": showzoomreports,
        "BLOCKPRICES": blockprices,
        "RFIDPRINTERNAME": rfidprintername,
        "EXPORT_FILE_PATH": exportFilePath,
        "ALLOWALLDATEDENTRIES": allowalldatedentries,
        "PLANETTERMINALID": planetterminalid,
        "fyearcode": fyearcode,
        "StartDate": startDate,
        "EndDate": endDate,
        "Status": status,
      };
}
