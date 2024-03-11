
import 'package:app/src/models/users.dart';

class GlobalUserData {
  static final GlobalUserData _instance = GlobalUserData._internal();
  factory GlobalUserData() {
    return _instance;
  }

  GlobalUserData._internal();

  Users loggedUser = Users(id: "", avatar: "", username: "");
  String token = "";
  bool isLoggedIn = false;
  bool dark = true;

}



