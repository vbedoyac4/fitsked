import 'dart:convert';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/entrenamientos_model.dart';
import 'package:http/http.dart' as http;

class EntrenamientosService {

  static const API = 'http://192.168.0.3:3000/';

  Future<APIResponse<List<Entrenamientos>>> EntrenamientosList(String nombre){
    return http.get(API + 'app/entrenamientos/'+ nombre)
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final entrenamientos = <Entrenamientos>[];
        for( var item in jsonData){
          entrenamientos.add(Entrenamientos.fromJson(item));
        }
        return APIResponse<List<Entrenamientos>>(data: entrenamientos);
      }
      return APIResponse<List<Entrenamientos>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Entrenamientos>>(error: true, errorMessage: error.toString()));

  }
}