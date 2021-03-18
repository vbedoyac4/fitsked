//
//import 'package:fitsked/models/api_response.dart';
//import 'package:fitsked/services/proveedores_service.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:fitsked/data/data.dart';
//import 'package:fitsked/models/proveedor_model.dart';
//import 'package:fitsked/views/proveedores_view.dart';
//import 'package:fitsked/widgets/rating_stars_widget.dart';
//import 'package:get_it/get_it.dart';
//
//
//class ProveedoresL extends StatelessWidget {
//
//  var elemento;
//
//  ProveedoresService get service => GetIt.instance<ProveedoresService>();
//  APIResponse<List<Proveedor>> _apiResponse;
//  bool _isLoading = false;
//
//
//
//
//
//  _buildAsistidas(BuildContext context, Proveedor _apiResponse){
//
//    return Container(
//        margin: EdgeInsets.all(10),
//        width: 390,
//        decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.circular(15),
//            border: Border.all(
//              width: 1,
//              color: Colors.grey[200],
//            )
//        ),
//        child: Row(
//          children: <Widget>[
//            ClipRRect(
//              borderRadius: BorderRadius.circular(15),
//              child: Hero(
//                tag: _apiResponse.imageUrl,
//                child: Image(
//                  height: 100,
//                  width: 100,
//                  image: AssetImage(
//                      _apiResponse.imageUrl
//                  ),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//            Container(
//              margin: EdgeInsets.all(12),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    _apiResponse.nombre,
//                    style: TextStyle(
//                        fontSize: 18,
//                        fontWeight: FontWeight.bold,
//                        color: Color(0xFF155F82)
//                    ),
//                    overflow: TextOverflow.ellipsis,
//                  ),
//                  SizedBox(
//                    height: 4,
//                  ),
//                  Text(
//                    _apiResponse.tipo,
//                    style: TextStyle(
//                        fontSize: 16,
//                        fontWeight: FontWeight.w600
//                    ),
//                    overflow: TextOverflow.ellipsis,
//                  ),
//                  RatingStars(_apiResponse.calificacion.toInt())
//                ],
//              ),
//            )
//          ],
//        )
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
////        Padding(
////          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
////          child: Text('Entrenamientos Recientes',
////            style: TextStyle(
////                fontSize: 20,
////                fontWeight: FontWeight.w600,
////                letterSpacing: 0.5,
////                color: Color(0xFF155F82)
////            ),
////          ),
////        ),
////        GestureDetector(
////          onTap: () => Navigator.push(
////            context, MaterialPageRoute(
////              //builder: (_) => ProveedorPage(proveedor: proveedoresLista[proveedoresLista.indexOf(elemento)]) ),
////              ),
////          child:
//              Container(
//              height: 400,
//              child: ListView.builder(
//                scrollDirection: Axis.vertical,
//                itemCount: _apiResponse.data.length,
//                itemBuilder: (BuildContext context, int index){
//                  Proveedor listaProveedores = _apiResponse.data[index];
//                  elemento = listaProveedores;
//                  return _buildAsistidas(context, listaProveedores);
//                },
//              ),
//            ),
//        ),
//      ],
//    );
//  }
//}
