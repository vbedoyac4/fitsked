import 'dart:ui';

import 'package:fitsked/data/data.dart';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/practicas_model.dart';
import 'package:fitsked/models/proveedor_model.dart';
import 'package:fitsked/services/practica_service.dart';
import 'package:fitsked/services/proveedores_service.dart';
import 'package:fitsked/views/proveedores_view.dart';
import 'package:fitsked/widgets/rating_stars_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



class PracticasWidget extends StatefulWidget {

  String correoController;
  PracticasWidget({this.correoController});

  @override
  _PracticasWidgetState createState() => _PracticasWidgetState();

}

class _PracticasWidgetState extends State<PracticasWidget> {
  var elemento;

  PracticasService get service => GetIt.instance<PracticasService>();
  APIResponse<List<Practicas>> _apiResponse;
  bool _isLoading = false;



  @override
  void initState() {
    _fetchPracticas();
    super.initState();
  }

  _fetchPracticas() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.allPracticas();

    setState(() {
      _isLoading = false;
    });
  }

  _buildAsistidas(BuildContext context, Practicas _apiResponse){

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProveedoresView(practicas: _apiResponse, correoController: widget.correoController.toString(),), )),
      child: Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: _apiResponse.imageUrl,
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(
                        _apiResponse.imageUrl
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _apiResponse.practica,
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
                    Visibility(
                      child: Text(widget.correoController.toString()),
                      visible: false,
                    ),
                    //RatingStars(_apiResponse.calificacion)
                  ],
                ),
              )
            ],
          )
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
              child: Text('No se encontraron practicas',
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
                  height: 700,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _apiResponse.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Practicas listaPracticas = _apiResponse.data[index];
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
