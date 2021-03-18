import 'dart:convert';

import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/login.dart';
import 'package:fitsked/models/login.dart';
import 'package:fitsked/models/user.model.dart';
import 'package:http/http.dart' as http;

class UsersService {

  static const API = 'http://192.168.0.5:3000/';
  static const headers = {
    "Accept": "application/json",
    'X-Powered-By': 'Express',
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'application/json;charset=utf-8',
    'Connection': 'keep-alive'
  };

  Future<APIResponse<bool>> login(Login item){
    return http.post(API + 'signin', headers: headers, body: json.encode(item.toJson()))
        .then((data){
      if (data.statusCode == 200 ){
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<bool>(error: true, errorMessage: 'Ha ocurrido un error'));

  }

  Future<APIResponse<bool>> register(Usuario item){
    return http.post(API + 'signup', headers: headers, body: json.encode(item.toJson()))
        .then((data){
      if (data.statusCode == 200 ){
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<bool>(error: true, errorMessage: 'Ha ocurrido un error'));

  }
}