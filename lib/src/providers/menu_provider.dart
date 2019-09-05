import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // para leer json

class _MenuProvider{
  List<dynamic> options=[];

  _MenuProvider(){ //construcot
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    
    final resp= await rootBundle.loadString("data/menu_opts.json");
    

    Map dataMap=json.decode(resp);
    print(dataMap["rutas"]);
    options=dataMap["rutas"];

    return options;
    
    
    /*rootBundle.loadString("data/menu_opts.json") ///lee el archivo json
      .then((data){

        Map dataMap= json.decode(data);
        print(dataMap["rutas"]);
        options=dataMap["rutas"];  //guardar datos de map en otra varible

      });*/

  }  

}



final menuProvider= new _MenuProvider(); //se crea instancia