class MenuModule {
  MenuModule({
    required this.message,
    required this.status,
    required this.response,
  });

  final String message;
  final String status;
  final List<ModuleResponse> response;

  factory MenuModule.fromJson(Map<String, dynamic> json) {
    return MenuModule(
      message: json["message"] ?? "",
      status: json["status"] ?? "",
      response: json["response"] == null
          ? []
          : List<ModuleResponse>.from(
              json["response"]!.map((x) => ModuleResponse.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "response": response.map((x) => x.toJson()).toList(),
      };
}

class ModuleResponse {
  ModuleResponse({
    required this.menuModule,
    required this.menuSubModule,
    required this.menuSubModuleGroup,
    required this.shortcutKey,
    required this.permission,
    required this.menuId,
    required this.menuCaptionEng,
    required this.mainVoctype,
    required this.voctype,
    required this.menuSrno,
    required this.angWebPathName,
    required this.angWebComponentName,
    required this.angWebControllerName,
    required this.headerTable,
    required this.gridDisplayRecordCount,
    required this.angWebFormName,
    required this.haschild,
    required this.visibleInWeb,
    required this.visibleInClient,
    required this.autoposting,
  });

  final String menuModule;
  final String menuSubModule;
  final String menuSubModuleGroup;
  final String shortcutKey;
  final String permission;
  final String menuId;
  final String menuCaptionEng;
  final String mainVoctype;
  final String voctype;
  final String menuSrno;
  final String angWebPathName;
  final String angWebComponentName;
  final String angWebControllerName;
  final String headerTable;
  final String gridDisplayRecordCount;
  final String angWebFormName;
  final bool haschild;
  final bool visibleInWeb;
  final bool visibleInClient;
  final bool autoposting;

  factory ModuleResponse.fromJson(Map<String, dynamic> json) {
    return ModuleResponse(
      menuModule: json["MENU_MODULE"] ?? "",
      menuSubModule: json["MENU_SUB_MODULE"] ?? "",
      menuSubModuleGroup: json["MENU_SUB_MODULE_GROUP"] ?? "",
      shortcutKey: json["SHORTCUT_KEY"] ?? "",
      permission: json["PERMISSION"] ?? "",
      menuId: json["MENU_ID"] ?? "",
      menuCaptionEng: json["MENU_CAPTION_ENG"] ?? "",
      mainVoctype: json["MAIN_VOCTYPE"] ?? "",
      voctype: json["VOCTYPE"] ?? "",
      menuSrno: json["MENU_SRNO"] ?? "",
      angWebPathName: json["ANG_WEB_PATH_NAME"] ?? "",
      angWebComponentName: json["ANG_WEB_COMPONENT_NAME"] ?? "",
      angWebControllerName: json["ANG_WEB_CONTROLLER_NAME"] ?? "",
      headerTable: json["HEADER_TABLE"] ?? "",
      gridDisplayRecordCount: json["GRID_DISPLAY_RECORD_COUNT"] ?? "",
      angWebFormName: json["ANG_WEB_FORM_NAME"] ?? "",
      haschild: json["HASCHILD"] ?? false,
      visibleInWeb: json["VISIBLE_IN_WEB"] ?? false,
      visibleInClient: json["VISIBLE_IN_CLIENT"] ?? false,
      autoposting: json["AUTOPOSTING"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "MENU_MODULE": menuModule,
        "MENU_SUB_MODULE": menuSubModule,
        "MENU_SUB_MODULE_GROUP": menuSubModuleGroup,
        "SHORTCUT_KEY": shortcutKey,
        "PERMISSION": permission,
        "MENU_ID": menuId,
        "MENU_CAPTION_ENG": menuCaptionEng,
        "MAIN_VOCTYPE": mainVoctype,
        "VOCTYPE": voctype,
        "MENU_SRNO": menuSrno,
        "ANG_WEB_PATH_NAME": angWebPathName,
        "ANG_WEB_COMPONENT_NAME": angWebComponentName,
        "ANG_WEB_CONTROLLER_NAME": angWebControllerName,
        "HEADER_TABLE": headerTable,
        "GRID_DISPLAY_RECORD_COUNT": gridDisplayRecordCount,
        "ANG_WEB_FORM_NAME": angWebFormName,
        "HASCHILD": haschild,
        "VISIBLE_IN_WEB": visibleInWeb,
        "VISIBLE_IN_CLIENT": visibleInClient,
        "AUTOPOSTING": autoposting,
      };
}
