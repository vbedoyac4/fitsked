import 'dart:convert';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/reserva_model.dart';
import 'package:http/http.dart' as http;

class AgendarService {

  static const API = 'http://192.168.0.3:3000/';
  static const headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
    'Connection': 'keep-alive'
  };
  static const isRedirect = true;

  Future<APIResponse<bool>> agendar(Agendar item) {
    return http.post(
        API + 'review/add', headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        //http.get(API + 'home/dashboard');
        final jsonData = json.decode(data.body);
        return APIResponse<bool>(data: false);
      }
      else {
        return APIResponse<bool>(data: true);
      }
    }).catchError((Object error) =>
        APIResponse<bool>(error: true,
            errorMessage: 'Se ha agregado exitosamente el review.'));
  }

  Future<APIResponse<List<Points>>> getPuntos(String correo){
    return http.get(API + 'app/puntos/'+correo)
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final practicasList = <Points>[];
        for( var item in jsonData){
          practicasList.add(Points.fromJson(item));
        }
        return APIResponse<List<Points>>(data: practicasList);
      }
      return APIResponse<List<Points>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Points>>(error: true, errorMessage: 'Ha ocurrido un error'));

  }

  Future<APIResponse<bool>> book(Agendar item) {
    return http.post(
        API + 'app/addentrenamientos', headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        //http.get(API + 'home/dashboard');
        final jsonData = json.decode(data.body);
        return APIResponse<bool>(data: false);
      }
      else {
        return APIResponse<bool>(data: true);
      }
    }).catchError((Object error) =>
        APIResponse<bool>(error: true,
            errorMessage: 'Se ha agendado exitosamente la sesión.'));
  }

}