import 'package:fitsked/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewsView extends StatefulWidget {
  @override
  _ReviewsViewState createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State <ReviewsView> {
  String dropdownValue = 'Seleccione';
  var rating = 5.0;

  Widget _buildNombreTF(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height:15),
        Container(
          alignment: Alignment.topLeft,
          decoration: kBoxDecorationStyle,
          height: 40,
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
              value: dropdownValue,
              iconSize: 25,
              elevation: 16,
              style: TextStyle(
                  color: Colors.grey,
                fontFamily: 'OpenSans'
              ),
              underline: Container(
                height: 2,
                width: 500,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Seleccione', 'Xtream Fitness', 'Erei Fitness']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(value,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18
                    ),),
                  ),
                );
              }).toList(),
            ),
        )
      ],
    );
  }

  Widget _Rating(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height:15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:SmoothStarRating(
              borderColor: Colors.white,
              color: Colors.white,
            rating: rating,
            isReadOnly: false,
            size: 25,
            filledIconData: Icons.star,
            //halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
            starCount: 5,
            allowHalfRating: true,
            spacing: 10.0,
            onRated: (value) {
              print("rating value -> $value");
              // print("rating value dd -> ${value.truncate()}");
            },
          )
          ),
      ),
    ]);
  }

  Widget _buildReview(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height:15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 120,
          child: TextField(
            //obscureText: true,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'OpenSans',
                fontSize: 18
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              prefixIcon: Icon(
                Icons.comment,
                color: Colors.white,
              ),
              hintText: 'Ingrese su Review',
              hintStyle: kHintTextStyle,
            ),
            maxLines: 12,
          ),
        )
      ],
    );
  }

  Widget _ButtonLogin(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
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
          'AGREGAR',
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
            onPressed: (){},
        ),
        title: Text('Reviews',
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
                        Text(
                          'Agrega tu Review',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildNombreTF(),
                        SizedBox(
                          height: 10,
                        ),
                        _Rating(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildReview(),
                        SizedBox(
                          height: 10,
                        ),
                        // _buildGeneroTF(),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //_buildFechaNTF(),
                        // _ButtonFecha(),
                        _ButtonLogin()
                      ]
                  ),
                )
            )
          ]),
    );
  }
}