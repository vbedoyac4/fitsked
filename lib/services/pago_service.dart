import 'dart:convert';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/pago_model.dart';
import 'package:http/http.dart' as http;

class PagosService {

  static const API = 'http://192.168.0.3:3000/';
  static const headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
    'Connection': 'keep-alive'
  };
  static const isRedirect = true;

  Future<APIResponse<bool>> pagos(Pago item) {
    return http.post(
        API + 'app/addpago', headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 302) {
        http.get(API + 'home/dashboard');
        final jsonData = json.decode(data.body);
        return APIResponse<bool>(data: true);
      }
      else {
        return APIResponse<bool>(data: false);
      }
    }).catchError((Object error) =>
        APIResponse<bool>(error: true, errorMessage: 'Ha ocurrido un error'));
  }
}