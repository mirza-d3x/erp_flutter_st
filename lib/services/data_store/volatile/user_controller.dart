final class UserController {
  static final UserController _instance = UserController._();
  UserController._();
  factory UserController() => _instance;

  String userEmail = "";
  String userPhone = "";
  Map<String, List<String>> retailMenuSubModules = {};

  void dispose() {
    userEmail = "";
    userPhone = "";
  }
}
