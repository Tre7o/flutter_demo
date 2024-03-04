class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phoneNo;
  final String? languagePref;
  final String? status;

  UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phoneNo,
      this.languagePref,
      this.status});

  toJson() {
    return {
      "fullName": name,
      "email": email,
      "password": password,
      "phoneNo": phoneNo,
      "languagePref": languagePref,
      "status": status
    };
  }
}
