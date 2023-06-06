import 'package:flutter/material.dart';

class Student {
  String user_type;
  String email;
  String password;
  String full_name;

  Student({
    this.user_type = "student",
    @required this.email,
    @required this.password,
    @required this.full_name,
  });

  Map<String, dynamic> toMap() =>
      {
        'type': user_type,
        'email': email,
        'password': password,
        'fullname': full_name,
      };

  String toString() {
    return "name: $full_name, user_type: $user_type, email: $email, password: $password";
  }
}