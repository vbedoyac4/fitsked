import 'package:fitsked/models/api_response.dart';
import 'package:fitsked/models/user.model.dart';
import 'package:fitsked/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitsked/views/login.dart';
import 'package:fitsked/utilities/constants.dart';
import 'package:get_it/get_it.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State <RegisterScreen> {

  DateTime _dateTime;

  UsersService get service => GetIt.instance<UsersService>();
  APIResponse<List<Usuario>> _apiResponse;
  bool _isLoading = false;
  bool _rememberMe = false;

  TextEditingController _correoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();

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

  Widget _buildNombreTF(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Nombre',
            style: kLabelStyle
        ),
        SizedBox(height:15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: _nombreController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 5),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: 'Ingrese su nombre',
                hintStyle: kHintTextStyle
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTelefonoTF(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Teléfono',
            style: kLabelStyle
        ),
        SizedBox(height:15),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: _telefonoController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 5),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                hintText: 'Ingrese su teléfono',
                hintStyle: kHintTextStyle
            ),
          ),
        )
      ],
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
              child: Column(
                children: <Widget>[
                  Text(_dateTime == null ? '' : _dateTime.toString()),
                  RaisedButton(

                    child: Text(
                        'Ingrese su fecha de nacimiento'
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: null,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1940),
                          lastDate: DateTime(2030)
                      ).then((date){
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                  )
                ],
              )

          )]);
  }

  Widget _buildEmailTF(){
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Correo',
            style: kLabelStyle
        ),
        SizedBox(height:12),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _correoController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 5),
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
          height: 40,
          child: TextField(
            obscureText: true,
            controller: _passwordController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
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

  Widget _ButtonLogin(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });

          final register = Usuario(nombre: _nombreController.text, password: _passwordController.text, correo: _correoController.text, telefono: _telefonoController.text);
          final result = await service.register(register);

          setState(() {
            _isLoading = false;
          });

          final titlw = 'Alerta';
          final text = result.error ? result.errorMessage: 'Registrado';

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
        //onPressed: () => print('Boton de Login presionado'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Text(
          'REGISTRATE',
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
                          'Registrate',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildNombreTF(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildPasswordTF(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildTelefonoTF(),
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