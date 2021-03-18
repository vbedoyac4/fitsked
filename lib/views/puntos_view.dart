import 'dart:ui';
import 'dart:convert';
import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/proveedor_model.dart';
import 'package:fitsked/services/proveedores_service.dart';
import 'package:fitsked/utilities/constants.dart';
import 'package:fitsked/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PuntosView extends StatefulWidget {
  @override
  _PuntosViewState createState() => _PuntosViewState();
}

class _PuntosViewState extends State <PuntosView> {
  //String dropdownValue = 'Seleccione';
  var rating = 5.0;
  var _currentItemSelected = 'Sitio de Entrenamiento';
  var _practicas = ['Tipo de Entrenamiento','Artes Marciales', 'Crossfit'];
  var proveedoresList = new List<Proveedores>();
  String proveedor;
  String hora;
  DateTime _dateTime;
  String _date = "Not set";
  String _time = "Not set";

  // Servicio de Proveedores
  Future<String> proveedores() async {
    var url = "http://192.168.0.5:3000/all_proveedores";
    var res = await http.get(url);
    var resBody = json.decode(res.body);

    setState(() {
      proveedoresList = resBody;
      print(proveedoresList.toList());
    });
  }

  @override
  void initState(){
    super.initState();

  }
  /////////////////////////////


  Widget _Rating(){
    return    Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height:15),
          Container(
            alignment: Alignment.topCenter,
            height: 270,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text('Agendar Entrenamiento',
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
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'x Puntos Disponibles', style: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        )
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
//                  child: Container(alignment: Alignment.centerLeft,
//                      decoration: kBoxDecorationStyle,
//                      height: 40,
//                      child: TextField(
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontFamily: 'OpenSans'
//                        ),
//                        decoration: InputDecoration(
//                          border: InputBorder.none,
//                          contentPadding: EdgeInsets.only(top: 6),
//                          prefixIcon: Icon(
//                            Icons.credit_card,
//                            color: Colors.white,
//                          ),
//                          hintText: 'Número de la tarjeta',
//                          hintStyle: kHintTextStyle,
//                        ),
//                      )
//                  ),
                child:    Container(
                  width: 500,
                  padding: new EdgeInsets.all(3) ,
                  decoration: BoxDecoration(
                    color: Color(0xFF155F82),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    dropdownColor: Color(0xFF155F82),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 25,
                    iconEnabledColor: Colors.white,
                    hint: Text('Seleccione lugar', style:TextStyle(
                      color: Colors.white60,
                    )),
                     value: proveedor,
                     items: <String>['Xtream Fitness','Erei Fitness','C'].map((String value){
                       return new DropdownMenuItem<String>(
                         value: value,
                         child: new Text(value, style: TextStyle(
                           color: Colors.white60,
                         ),),
                       );
                     }).toList(),
                    onChanged: (value){
                      setState(() {
                        proveedor = value;
                      });
                    },
                  )

                ),
                ),
                Container(
                    width: 500,
                    margin: const EdgeInsets.only(top: 20),
                    padding: new EdgeInsets.all(3) ,
                    decoration: BoxDecoration(
                      color: Color(0xFF155F82),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(

                      dropdownColor: Color(0xFF155F82),
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 25,
                      iconEnabledColor: Colors.white,
                      hint: Text('Hora', style:TextStyle(
                        color: Colors.white60,
                      )),
                      value: hora,
                      items: <String>['6 AM','7 AM', '8 AM', '9 AM', '10 AM', '11 AM', '12 PM', '1 PM', '2 PM', '3 PM', '4 PM', '5 PM','6 PM', '7 PM', '8 PM'].map((String value){
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value, style: TextStyle(
                            color: Colors.white60,
                          ),),
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          hora = value;
                        });
                      },
                    )

                ),
//                Padding(
//                  padding: const EdgeInsets.only(top:15.0),
//                  child: Container(alignment: Alignment.centerLeft,
//                      decoration: kBoxDecorationStyle,
//                      height: 40,
//                      child: TextField(
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontFamily: 'OpenSans'
//                        ),
//                        decoration: InputDecoration(
//                          border: InputBorder.none,
//                          contentPadding: EdgeInsets.only(top: 6),
//                          prefixIcon: Icon(
//                            Icons.date_range,
//                            color: Colors.white,
//                          ),
//                          hintText: 'Válida hasta (mes/año)',
//                          hintStyle: kHintTextStyle,
//                        ),
//                      )
//                  ),
//                ),

              ],
            ),
          ),
        ]);
  }

  Widget _ButtonLogin(){
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 25.0),
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
          'AGENDAR',
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

  Widget _buildFechaNTF(){
    return    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:15),
          Container(
              alignment: Alignment.centerLeft,
              //decoration: kBoxDecorationStyle,
              //height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2020, 5, 1),
                      maxTime: DateTime(2060, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.es);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.white60,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Seleccione",
                        style: TextStyle(
                            color: Colors.white60,
                            //fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
                color: Color(0xFF155F82),
              )

          )]);
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
        title: Text('Agendar',
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
                        _buildFechaNTF(),
                        _ButtonLogin(),

                      ]
                  ),
                )
            )
          ]),
    );
  }
}