
class Users {
  final String id;
  final String last_name;
  final String email;
  final String first_name;
  bool isVerified;

  Users(
      {required this.id,
      required this.last_name,
      required this.email,
      required this.first_name,
      required this.isVerified});

  factory Users.fromFireStore(Map<String, dynamic> data, String usersDoc) {
    return Users(
        id: usersDoc,
        last_name: data["last_name"],
        email: data["email"],
        first_name: data["first_name"],
        isVerified: data["isVerified"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_name': last_name,
      'first_name': first_name,
      'email': email,
      'isVerified': isVerified
    };
  }
}




