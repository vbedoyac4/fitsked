import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Puntos{
 // final int id_a;
  final String nombre;
  final String fecha;
  final String hora;

  Puntos(
      {
        // this.id_a,
         this.nombre,
         this.fecha,
         this.hora
      });

  factory Puntos.fromJson(Map<String, dynamic > item){
    return Puntos(
      //id_a: item['id_a'],
      nombre: item['nombre'],
      fecha: item['fecha'],
      hora: item['hora']
    );
  }
}

class Points{
  // final int id_a;
  final int puntos;

  Points(
      {
        // this.id_a,
        this.puntos
      });

  factory Points.fromJson(Map<String, dynamic > item){
    return Points(
      //id_a: item['id_a'],
        puntos: item['puntos']
    );
  }
}

class Agendar{
  String fecha;
  String hora;
  String nombre;
  String id_u;
  String cupo;


  Agendar(
      {
        @required this.fecha,
        @required this.hora,
        @required this.nombre,
        @required this.id_u,
        @required this.cupo
      });

  Map<String, dynamic> toJson(){
    return {
      "fecha": fecha,
      "hora": hora,
      "nombre": nombre,
      "id_u": id_u,
      "cupo": cupo
    };
  }
}

