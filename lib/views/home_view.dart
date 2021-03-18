import 'dart:ui';

import 'package:fitsked/data/data.dart';
import 'package:fitsked/models/practicas.model.dart';
import 'package:fitsked/models/proveedor_model.dart';
import 'package:fitsked/views/agendar_view.dart';
import 'package:fitsked/views/puntos_view.dart';
import 'package:fitsked/widgets/recientes_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitsked/views/proveedores_view.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}



class _HomeViewState extends State<HomeView> {

  _buildPracticas(){
    List<Widget>  practicasList = [];
    practicas.forEach((Practica practica) {
      practicasList.add(
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProveedoresView(practica: practica), )),
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1,
                    color: Colors.grey[200]
                )
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: practica.imageUrl,
                    child: Image(
                      height: 130,
                      width: 130,
                      image: AssetImage(
                          practica.imageUrl
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        practica.tipo,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF155F82)
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      //RatingStars(proveedor.rating),
//                    Text(
//                      proveedor.tipo,
//                      style: TextStyle(
//                        fontSize: 16,
//                        fontWeight: FontWeight.w600
//                      ),
//                      overflow: TextOverflow.ellipsis,
//                    ),
                      SizedBox(
                        height: 4,
                      ),
//                    Text(
//                      proveedor.address,
//                        style: TextStyle(
//                        fontSize: 12,
//                        fontWeight: FontWeight.w600
//                    ),
//                      overflow: TextOverflow.ellipsis,
//                    )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
        children: practicasList
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.add_circle
          ),
          iconSize: 30,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PuntosView())),
        ),
        title: Text(
          'Practicas',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.credit_card
            ),
            iconSize: 30,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AgendarView())),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: ListView(
          children: <Widget>[
            //Recientes(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Tipos de Practicas',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(0xFF155F82),
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
               _buildPracticas()
              ],
            )
          ],
        ),
      ),
    );
  }
}
