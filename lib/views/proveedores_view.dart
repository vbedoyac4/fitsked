import 'dart:ui';

import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/proveedor_model.dart';
import 'package:fitsked/services/proveedores_service.dart';
import 'package:get_it/get_it.dart';
import 'package:fitsked/views/proveedor_view.dart';
import 'package:fitsked/models/practicas.model.dart';
import 'package:flutter/material.dart';

class ProveedoresView extends StatefulWidget {
  // Traer Nombre datos de la practica del menu anterior
  final Practica practica;
  ProveedoresView({this.practica});
  /////////////////////////

  @override
  _ProveedoresViewState createState() => _ProveedoresViewState();
}

class _ProveedoresViewState extends State<ProveedoresView> {

  // Servicio de Proveedores
  ProveedoresService get service => GetIt.I<ProveedoresService>();
  APIResponse<List<Proveedor>> _apiResponse;
  bool _isLoading = false;

   @override
  void initState() {
    _fetchProveedores();
    super.initState();
  }

  _fetchProveedores() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.ProveedoresList(widget.practica.tipo);

    setState(() {
      _isLoading = false;
    });
  }
  /////////////////////////////

  Widget build(BuildContext context) {
    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          Stack(
//            children: <Widget>[
//              Image(
//                height: 220,
//                width: MediaQuery.of(context).size.width,
//                image: AssetImage(widget.practica.imageUrl),
//                fit: BoxFit.cover,
//              ),
//              Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    IconButton(
//                      icon: Icon(Icons.arrow_back_ios),
//                      color: Colors.white,
//                      iconSize: 30,
//                      onPressed: () => Navigator.pop(context),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//          Padding(
//            padding: const EdgeInsets.all(20),
//            child: Column(
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text(widget.practica.tipo,
//                      style: TextStyle(
//                          fontSize: 35,
//                          fontWeight: FontWeight.bold,
//                          color: Color(0xFF155F82),
//                          fontFamily: 'OpenSans'
//                      ),
//                    ),
//                  ],
//                ),
//                SizedBox(
//                  height: 10
//                ),
                body:
                Column(
                  children: <Widget>[
                Stack(
                children: <Widget>[
                  Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.practica.imageUrl),
                  fit: BoxFit.cover,
                ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              iconSize: 30,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      ],
    ),
           Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.practica.tipo,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF155F82),
                          fontFamily: 'OpenSans'
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10
                ),
                Builder(
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
                        child: Text('No se encontraron proveedores',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                            fontFamily: 'OpenSans'
                          ),),
                      ));
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (_, __) =>
                          Divider(height: 1, thickness: 1.5, color: Color(0xFF155F82)),
                      itemBuilder: (_, index) {
                        return Dismissible(
                          key: ValueKey(_apiResponse.data[index].id_u),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {},
//                          confirmDismiss: (direction) async {
//                            final result = await showDialog(
//                                context: context, builder: (_) => NoteDelete());
//                            print(result);
//                            return result;
//                          },
                          child: ListTile(
                            title: Text(
                              _apiResponse.data[index].nombre,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            subtitle: Text(
                                _apiResponse.data[index].tipo),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Proveedor_View(
                                      proveedor: _fetchProveedores(),)));
                            },
                          leading: SizedBox(
                              height: 100.0,
                              width: 100.0, // fixed width and height
                          child: Image.asset(_apiResponse.data[index].imageUrl,
                              fit: BoxFit.cover)
                          ),
                        ));
                      },
                      itemCount: _apiResponse.data.length,
                    );
                  },
                )]))])

//                Expanded(
//                  child: GridView.count(
//                    crossAxisCount:2,
//                    children: List.generate(_apiResponse.data.length, (index) {
//                      Proveedor proveedor = _apiResponse.data[index];
//                      return Center(
//                        child: Text(proveedor.nombre),
//                      );
//                    }),
//                  ),
//                ))
//              ],
//            ),
//          )
//        ],
//      ),
//    );
  //}
    );}
//}
}
