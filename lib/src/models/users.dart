class Users {
  final String id;
  final String username;
  final String? avatar;
  Users({required this.id, required this.username, this.avatar});
  static Users fromMap({required Map user}) {
    return Users(
      id: "",
      username: user["username"],
      avatar: ""
    );
  }
}