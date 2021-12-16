import 'dart:convert';

import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';

class UserModel extends User {
  String? uid;
  String? name;
  String? email;

  UserModel({this.uid, this.name, this.email});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
