import 'dart:convert';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/reserva_model.dart';
import 'package:http/http.dart' as http;

class ReservasService {

  static const API = 'http://192.168.0.3:3000/';

  Future<APIResponse<List<Puntos>>> ReservasList(String correo){
    return http.get(API + 'app/reservas/'+ correo)
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final reservas = <Puntos>[];
        for( var item in jsonData){
          reservas.add(Puntos.fromJson(item));
        }
        return APIResponse<List<Puntos>>(data: reservas);
      }
      return APIResponse<List<Puntos>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Puntos>>(error: true, errorMessage: error.toString()));

  }
}