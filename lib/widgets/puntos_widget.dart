import 'dart:ui';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/practicas_model.dart';
import 'package:fitsked/models/reserva_model.dart';
import 'package:fitsked/services/agendar_service.dart';
import 'package:fitsked/services/practica_service.dart';
import 'package:fitsked/services/reservas_service.dart';
import 'package:fitsked/views/proveedores_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



class PuntosWidget extends StatefulWidget {

  String correoController;
  PuntosWidget({this.correoController});

  @override
  _PuntosWidgetState createState() => _PuntosWidgetState();

}

class _PuntosWidgetState extends State<PuntosWidget> {
  var elemento;

  AgendarService get service => GetIt.instance<AgendarService>();
  APIResponse<List<Points>> _apiResponse;
  bool _isLoading = false;



  @override
  void initState() {
    _fetchPoints();
    super.initState();
  }

  _fetchPoints() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getPuntos(widget.correoController.toString());

    setState(() {
      _isLoading = false;
    });
  }

  _buildAsistidas(BuildContext context, Points _apiResponse){

    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Puntos Disponibles: '+_apiResponse.puntos.toString(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4,
          ),
          Visibility(
            child: Text(widget.correoController.toString()),
            visible: false,
          ),
          //RatingStars(_apiResponse.calificacion)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (_) {
          if (_isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (_apiResponse.error) {
            return Center(child: Text(_apiResponse.errorMessage));
          }

          if (_apiResponse.data.length < 1) {
            return Center(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Text('No se encontraron puntos',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontFamily: 'OpenSans'
                ),),
            ));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                child: Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _apiResponse.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Points listaPracticas = _apiResponse.data[index];
                      elemento = listaPracticas;
                      return _buildAsistidas(context, listaPracticas);
                    },
                  ),
                ),
              )
            ],
          );
        });
  }
}
