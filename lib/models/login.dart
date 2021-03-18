import 'package:flutter/foundation.dart';

class Login{
  String correo;
  String password;

  Login(
      {
        @required this.correo,
        @required this.password,
      });

  Map<String, dynamic> toJson(){
    return {
      "correo": correo,
      "password": password
    };
  }
}