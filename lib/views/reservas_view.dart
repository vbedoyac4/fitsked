import 'dart:ui';

import 'package:fitsked/widgets/reservas_widget.dart';
import 'package:flutter/material.dart';
import 'package:fitsked/models/review_model.dart';

class ReservasView extends StatefulWidget {

  String correoController;
  ReservasView({this.correoController});

  @override
  _ReservasViewState createState() => _ReservasViewState();
}

class _ReservasViewState extends State<ReservasView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF155F82)
        ),
        backgroundColor: Colors.white,
        title: Text('Mis Reservaciones',
        style: TextStyle(
          color: Color(0xFF155F82)
        ),),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF155F82),
                    Color(0xFF236c8e),
                    Color(0xFF387693),
                    Color(0xFF498caa)
                  ],
                  stops: [0.1, 0.4, 0.7,0.9],
                )
            ),
          ),
          ReservasWidget(correoController: widget.correoController,),
        ],
      ),
    );
  }
}
