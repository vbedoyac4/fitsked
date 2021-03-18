import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Review{
  String fecha;
  String review;
  double calificacion;
  String id_user;
  String id_gym;

  Review(
      {
        @required this.fecha,
        @required this.review,
        @required this.calificacion,
        @required this.id_user,
        @required this.id_gym,
      });

  Map<String, dynamic> toJson(){
    return {
      "fecha": fecha,
      "review": review,
      "calificacion": calificacion,
      "id_user": id_user,
      "id_gym": id_gym
    };
  }
}

