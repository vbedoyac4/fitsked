//import 'package:flutter/material.dart';
//
//class Recientes extends StatelessWidget {
//
//  _buildRecientes(BuildContext context, Agendado agendado ){
//    return Container(
//      margin: EdgeInsets.all(10),
//      width: 320,
//      decoration: BoxDecoration(
//        color: Color(0xFF155F82),
//        borderRadius: BorderRadius.circular(15),
//        border: Border.all()
//      ),
//    )
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          child: Text(
//            'Entrenamientos Recientes',
//            style: TextStyle(
//              fontWeight: FontWeight.w600,
//              fontSize: 24,
//              color: Color(0xFF155F82)
//            ),
//          ),
//        ),
//        Container(
//          height: 120,
//          child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: ,
//              itemBuilder:(BuilderContext context, int index){
//                Agendado agendado = ;
//                return _buildRecientes(context, agendado)
//              } ),
//        )
//      ],
//    );
//  }
//}
