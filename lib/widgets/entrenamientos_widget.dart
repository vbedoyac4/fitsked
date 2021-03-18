import 'dart:ui';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/entrenamientos_model.dart';
import 'package:fitsked/services/entrenamientos_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EntrenamientosWidget extends StatefulWidget {

  final String proveedor;
  EntrenamientosWidget({this.proveedor});

  @override
  _EntrenamientosWidgetState createState() => _EntrenamientosWidgetState();

}

class _EntrenamientosWidgetState extends State<EntrenamientosWidget> {
  var elemento;

  EntrenamientosService get service => GetIt.instance<EntrenamientosService>();
  APIResponse<List<Entrenamientos>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchEntrenamientos();
    super.initState();
  }

  _fetchEntrenamientos() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.EntrenamientosList(widget.proveedor.toString());

    setState(() {
      _isLoading = false;
    });
  }

  _buildAsistidas(BuildContext context, Entrenamientos _apiResponse){

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
                    _apiResponse.fecha.toString(),
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
                  Text(
                    'Hora: '+_apiResponse.hora,
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
                   'Cupos Disponibles: '+_apiResponse.cupos.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Visibility(
                    child: Text(widget.proveedor.toString()),
                    visible: false,
                  )
                  //RatingStars(_apiResponse.calificacion)
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
              child: Text('No se encontraron entrenamientos',
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
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _apiResponse.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Entrenamientos listaEntrenamientos = _apiResponse.data[index];
                      elemento = listaEntrenamientos;
                      return _buildAsistidas(context, listaEntrenamientos);
                    },
                  ),
                ),
              )
            ],
          );
        });
  }
}
