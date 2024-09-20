final class UserController {
  static final UserController _instance = UserController._();
  UserController._();
  factory UserController() => _instance;

  String userEmail = "";
  String userPhone = "";

  void dispose() {
    userEmail = "";
    userPhone = "";
  }
}
