import 'package:fitsked/services/proveedores_service.dart';
import 'package:fitsked/services/user_service.dart';
import 'package:fitsked/views/agendar_view.dart';
import 'package:fitsked/views/home_view.dart';
import 'package:fitsked/views/login.dart';
import 'package:fitsked/views/proveedores_view.dart';
import 'package:fitsked/views/puntos_view.dart';
import 'package:fitsked/views/test_view.dart';
import 'package:flutter/material.dart';
import 'views/reviews.view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:get_it/get_it.dart';

void setupLocator(){
  GetIt.instance.registerLazySingleton(() => UsersService());
  GetIt.instance.registerLazySingleton(() => ProveedoresService());
}
void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:[
        const Locale('es', 'HN'), // Espa;ol
        const Locale('en', 'US'), // English
      ] ,
      title: 'FITSKED',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor:Colors.white,
          primaryColor: Color(0xFF155F82)
      ),
      home: LoginScreen(),
    );
  }
}