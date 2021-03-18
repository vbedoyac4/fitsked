import 'dart:ui';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/reserva_model.dart';
import 'package:fitsked/services/reservas_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ReservasWidget extends StatefulWidget {

  String correoController;
  ReservasWidget({this.correoController});

  @override
  _ReservasWidgetState createState() => _ReservasWidgetState();

}

class _ReservasWidgetState extends State<ReservasWidget> {
  var elemento;
  //final format = DateFormat("yyyy-MM-dd");

  ReservasService get service => GetIt.instance<ReservasService>();
  APIResponse<List<Puntos>> _apiResponse;
  bool _isLoading = false;


  @override
  void initState() {
    _fetchReservas();
    super.initState();
  }

  _fetchReservas() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.ReservasList(widget.correoController.toString());

    setState(() {
      _isLoading = false;
    });
  }

  _buildAsistidas(BuildContext context, Puntos _apiResponse){
    var fecha = _apiResponse.fecha;
    return Container(
        margin: EdgeInsets.all(10),
        width: 390,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Colors.grey[200],
            )
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _apiResponse.nombre,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF155F82)
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(_apiResponse.fecha,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    _apiResponse.hora,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        )
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
              child: Text('No se encontraron reservas',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
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
                  height: 593,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _apiResponse.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Puntos listaReservas = _apiResponse.data[index];
                      elemento = listaReservas;
                      return _buildAsistidas(context, listaReservas);
                    },
                  ),
                ),
              )
            ],
          );
        });
  }
}
