import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/proveedor_model.dart';
import 'package:fitsked/services/proveedores_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Proveedor_View extends StatefulWidget {

  final Proveedor proveedor;
  Proveedor_View({this.proveedor});


  @override
  _Proveedor_ViewState createState() => _Proveedor_ViewState();
}

class _Proveedor_ViewState extends State<Proveedor_View> {

  // Servicio de Proveedores
  ProveedoresService get service => GetIt.I<ProveedoresService>();
  APIResponse<List<Proveedor>> _apiResponse;

  bool _isLoading = false;

  @override
  void initState() {
    //_fetchProveedores();
    super.initState();
  }

//  _fetchProveedores() async {
//    setState(() {
//      _isLoading = true;
//    });
//
//    //_apiResponse = await service.ProveedorList(widget.proveedor.id_u);
//
//    setState(() {
//      _isLoading = false;
//    });
//
//  }
  /////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center ,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                      widget.proveedor.imageUrl
                  ),
                  fit: BoxFit.cover,
                ),

              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                 child:Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     IconButton(icon: Icon(
                         Icons.arrow_back
                     ),
                         color: Colors.white,
                         iconSize: 35,
                         onPressed: () => Navigator.pop(context)
                     ),
                     IconButton(icon: Icon(
                         Icons.favorite
                     ),
                       color: Colors.red,
                       iconSize: 35,
                       onPressed: () {},
                     ),
                   ],
                 )
             )
            ],
          )

        ],
      ),
    );
  }
}
