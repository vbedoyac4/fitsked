import 'dart:convert';

import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/proveedor_model.dart';
import 'package:fitsked/models/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

class ProveedoresService {

  static const API = 'http://192.168.0.5:3000/';

  ///PROVEEDORES POR TIPO DE SERVICIO
  Future<APIResponse<List<Proveedor>>> ProveedoresList(String tipo){
    return http.get(API + 'proveedores_tipo/'+ tipo)
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final proveedores = <Proveedor>[];
        for( var item in jsonData){
          proveedores.add(Proveedor.fromJson(item));
        }
        return APIResponse<List<Proveedor>>(data: proveedores);
      }
      return APIResponse<List<Proveedor>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Proveedor>>(error: true, errorMessage: 'Ha ocurrido un error'));

  }

  ///TODOS LOS NOMBRES DE LOS PROVEEDORES
  Future<APIResponse<List<Proveedor>>> allProveedores(){
    return http.get(API + 'all_proveedores')
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final proveedores = <Proveedor>[];
        for( var item in jsonData){
          proveedores.add(Proveedor.fromJson(item));
        }
        return APIResponse<List<Proveedor>>(data: proveedores);
      }
      return APIResponse<List<Proveedor>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Proveedor>>(error: true, errorMessage: 'Ha ocurrido un error'));

  }

  Future<APIResponse<List<Proveedor>>> ProveedorList(int id_u ){
    return http.get(API + 'proveedores_tipo/'+ id_u.toString())
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final proveedores = <Proveedor>[];
        for( var item in jsonData){
          proveedores.add(Proveedor.fromJson(item));
        }
        return APIResponse<List<Proveedor>>(data: proveedores);
      }
      return APIResponse<List<Proveedor>>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<List<Proveedor>>(error: true, errorMessage: 'Ha ocurrido un error'));

  }

  Future<APIResponse<Proveedor>> getProveedor(int id_u ){
    return http.get(API + 'app/proveedor/' + id_u.toString())
        .then((data){
      if (data.statusCode == 200){
        final jsonData = json.decode(data.body);
        return APIResponse<Proveedor>(data: Proveedor.fromJson(jsonData));
      }
      return APIResponse<Proveedor>(error: true, errorMessage: 'Ha ocurrido un error');
    }).catchError((Object error)=> APIResponse<Proveedor>(error: true, errorMessage: 'Ha ocurrido un error'));

  }

  static Future getProveedores(){
    var url = "http://192.168.0.5:3000/all_proveedores";
    return http.get(url);
  }
}