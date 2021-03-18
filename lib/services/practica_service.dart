import 'dart:convert';
import 'package:fitsked/models/practicas_model.dart';
import 'package:http/http.dart' as http;
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/practicas.model.dart';

class PracticasService{

  static const API = 'http://192.168.0.3:3000/';

  ///TODOS LOS NOMBRES DE LOS PROVEEDORES
  Future<APIResponse<List<Practicas>>> allPracticas(){
    return http.get(API + 'app/practicas')
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final practicasList = <Practicas>[];
        for( var item in jsonData){
          practicasList.add(Practicas.fromJson(item));
        }
        return APIResponse<List<Practicas>>(data: practicasList);
      }
      return APIResponse<List<Practicas>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Practica>>(error: true, errorMessage: 'Ha ocurrido un error'));

  }
}