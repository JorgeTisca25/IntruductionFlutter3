import 'package:flutter/material.dart';

final _icons=<String, IconData>{ //es un map
  "add_alert" :Icons.add_alert,
  "accessibility" :Icons.accessibility,
  "folder_open" :Icons.folder_open,
  "donut_large " : Icons.donut_large,
  "input " : Icons.input ,
  "tune "  :Icons.tune,
  "list"  :Icons.list,
} ;





Icon getIcon(String nombreIcono){  //mada a llamar a icons para seleccionar el icono por nombre


  return Icon(_icons[nombreIcono],color:Colors.blue); //requiere un icon data

  
}