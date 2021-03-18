import 'package:flutter/foundation.dart';
class Pago{
  String id_u;

  Pago(
      {
        @required this.id_u
      });

  Map<String, dynamic> toJson(){
    return {
      "id_u": id_u,
    };
  }
}