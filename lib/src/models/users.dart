class Users {
  final String id;
  final String username;
  final String? avatar;
  Users({required this.id, required this.username, this.avatar});
  static Users fromMap({required Map user}) {
    String avatar = "https://v1flix-v2.netlify.app/assets/avatar.png";
    if(user["avatar"] != null && user["avatar"] != "") {
      print("Test user avatar");
      avatar = user["avatar"];
    }
    return Users(
      id: "",
      username: user["username"],
      avatar: avatar
    );
  }
}