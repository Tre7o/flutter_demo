import 'package:cloud_firestore/cloud_firestore.dart';

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

  // mapping a user fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return UserModel(
      id: documentSnapshot.id,
      name: data['fullName'], 
      email: data['email'], 
      password: data['password'], 
      phoneNo: data['phoneNo']
    );
  }
}
