//mateapp - para generar estructura
import 'package:flutter/material.dart';

//Our imports

import 'package:flutter_components/src/pages/alert_pages.dart';

import 'package:flutter_components/src/routes/routes.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      //home: HomePage(),
      ////////////rutas
      
      initialRoute: "/",     //este es donde inicia la app
      routes: getApplicationRoutes(),
      onGenerateRoute:  (RouteSettings settings){//regresa una ruta de cualquier tipo,
        
        print("Ruta llamada: ${settings.name}");
        return MaterialPageRoute(
          
          builder:(BuildContext context) {
            return AlertPage();
          }
          );
      }
      ///////////////////////////
    );
  }
}