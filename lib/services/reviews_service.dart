import 'dart:convert';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/review_model.dart';
import 'package:http/http.dart' as http;

class ReviewsService {

  static const API = 'http://192.168.0.3:3000/';
  static const headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
    'Connection': 'keep-alive'
  };
  static const isRedirect = true;

  Future<APIResponse<bool>> review(Review item) {
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
        APIResponse<bool>(error: true, errorMessage: 'Se ha agregado exitosamente el review.'));
  }
}