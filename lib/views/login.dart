import 'dart:async';
import 'dart:convert';

import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/login.dart';
import 'package:fitsked/models/user.model.dart';
import 'package:fitsked/services/user_service.dart';
import 'package:fitsked/views/home_view.dart';
import 'package:fitsked/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitsked/utilities/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State <LoginScreen> {

  UsersService get service => GetIt.instance<UsersService>();
  APIResponse<List<Usuario>> _apiResponse;
  bool _isLoading = false;
  bool _rememberMe = false;

  TextEditingController _correoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  initState(){
    _fetchUsers();
    super.initState();
  }

  _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });


   // _apiResponse = await service.UsersList();

    setState(() {
      _isLoading = false;
    });
  }


  Widget _buildEmailTF(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Correo',
            style: kLabelStyle
        ),
        SizedBox(height:18),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: _correoController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Ingrese su correo',
                hintStyle: kHintTextStyle
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Password',
            style: kLabelStyle
        ),
        SizedBox(height:18),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            onTap: () {},
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Ingrese su password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _ForgotPassword(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
        padding: EdgeInsets.only(right: 8),
        child: Text(
          'Registrate',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _ButtonLogin(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          setState(() {
            _isLoading = true;
          });
          final login = Login(correo: _correoController.text, password: _passwordController.text);
          final result = await service.login(login);

          setState(() {
            _isLoading = false;
          });

          final titlw = 'Error';
          final text = result.error ? result.errorMessage: 'Logueado';

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(titlw),
              content: Text(text),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          );
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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

  Widget _RemembermeCheckBox() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Color(0xFF155F82),
              activeColor: Colors.white,
              onChanged: (value){
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Recordarme',
            style:kLabelStyle ,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ingresa',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30,
                      ),
                      _buildPasswordTF(),
                      _ForgotPassword(),
                      _RemembermeCheckBox(),
                      _ButtonLogin()
                    ],
                  ),
                )
            )
          ]),
    );
  }
}