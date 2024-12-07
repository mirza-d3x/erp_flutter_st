final class UserController {
  static final UserController _instance = UserController._();
  UserController._();
  factory UserController() => _instance;

  String userName = "";
  String groupName = "";
  String userBranch = "";
  String userYear = "";
  Map<String, List<String>> retailMenuSubModules = {};

  void dispose() {
    userName = "";
    userBranch = "";
    userBranch = '';
    userYear = '';
  }
}
