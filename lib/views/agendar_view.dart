import 'dart:ui';

import 'package:fitsked/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

import 'home_view.dart';

class AgendarView extends StatefulWidget {
  @override
  _AgendarViewState createState() => _AgendarViewState();
}



class _AgendarViewState extends State <AgendarView> {
  String dropdownValue = 'Seleccione';
  var rating = 5.0;
  DateTime selectedDate = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget _buildFechaNTF(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        SizedBox(height:5),
        Container(
          alignment: Alignment.topCenter,
          decoration: kBoxDecorationStyle,
          height: 40,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            child: Container(alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 20,
            child: TextField(
              onTap: () => _selectDate(context),
                style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
             ),
            decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -9),
            prefixIcon: Icon(
              Icons.date_range,
              color: Colors.white,
            ),
            hintText: '${formatDate(selectedDate.toLocal(), [yyyy, '-', mm, '-', dd])}',
            hintStyle: kHintTextStyle,
            ),
            )
            )
          ),

              //Text("${formatDate(selectedDate.toLocal(), [yyyy, '-', mm, '-', dd])}"),
              //SizedBox(height: 20.0,),
             // RaisedButton(
             //   onPressed: () => _selectDate(context),
             //   child: Text('Select date'),
              //),
            ],
          )
        )
    ]);
  }
  Widget _buildFechaNT(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height:10),
          Container(
              alignment: Alignment.topCenter,
              decoration: kBoxDecorationStyle,
              height: 70,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 150),
                        child: Text("${formatDate(selectedDate.toLocal(), [yyyy, '-', mm, '-', dd])}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans'
                          ),
                        ),
                      ),
                      //SizedBox(height: 20.0,),
                      RaisedButton(
                        elevation: 2,
                        color: Colors.white,
                        onPressed: () => _selectDate(context),
                        child: Text('...',
                          style: TextStyle(
                              color: Color(0xFF155F82),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'
                          ),),
                      )
                    ],
                  )
                  //Text("${formatDate(selectedDate.toLocal(), [yyyy, '-', mm, '-', dd])}"),
                  //SizedBox(height: 20.0,),
                  // RaisedButton(
                  //   onPressed: () => _selectDate(context),
                  //   child: Text('Select date'),
                  //),
                ],
              )
          )
        ]);
  }//Fecha sin arreglar


Widget _Rating(){
    return    Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height:15),
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text('Pago Menbresia',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Container(alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans'
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 6),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: 'Nombre que aparece en la tarjeta',
                          hintStyle: kHintTextStyle,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Container(alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans'
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 6),
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: Colors.white,
                          ),
                          hintText: 'Número de la tarjeta',
                          hintStyle: kHintTextStyle,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Container(alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans'
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 6),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          hintText: 'Número de seguridad (4 dígitos)',
                          hintStyle: kHintTextStyle,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Container(alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans'
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 6),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          hintText: 'Válida hasta (mes/año)',
                          hintStyle: kHintTextStyle,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  Widget _ButtonLogin(){
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Boton de Login presionado'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Text(
          'PAGAR',
          style: TextStyle(
              color: Color(0xFF155F82),
              letterSpacing: 3.5,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color:  Color(0xFF155F82),),
          iconSize: 30,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView())),
        ),
        title: Text('Pagos',
          style: TextStyle(
              color:  Color(0xFF155F82)
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
            Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 40
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
//                        Text(
//                          'Tus Puntos',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontFamily: 'OpenSans',
//                            fontSize: 30,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
                        SizedBox(
                          height: 10,
                        ),
//                        Container(
//                          height: 40,
//                          alignment: Alignment.topLeft,
//                          decoration: kBoxDecorationStyle,
//                          child: Row(
//                            children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.all(10.0),
//                                child: Text('Puntos Actuales',
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 20,
//                                    fontFamily: 'OpenSans',
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(10.0),
//                                child: Text('25',
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 20,
//                                    fontFamily: 'OpenSans',
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
                        _Rating(),
                       // _buildFechaNTF(),
                        _ButtonLogin(),
                      ]
                  ),
                )
            )
          ]),
    );
  }
}
