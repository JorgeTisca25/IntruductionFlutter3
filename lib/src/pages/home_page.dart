import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),

      body: _lista(),
    );
  }

  Widget _lista() {
   // print(menuProvider.options);
    menuProvider.cargarData().then((options){

      print("_lista");
      print(options);

    });
    return ListView(
      children: _listaItems(),
    );
  }



  List<Widget> _listaItems() {
    return [
      ListTile(title: Text("Hola Mundo"),)
    ];
  }
}