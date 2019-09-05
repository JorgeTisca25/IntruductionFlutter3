import "package:flutter/material.dart";


class HomepageTemp extends StatelessWidget {    //stateless para que te fore mas rapido 
 
  final options =["Uno","Dos","Tres","Cuatro","Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
        body: ListView(
          children: _creatItemsShort() 
        ),

    );

  }


  List<Widget> _creatItems(){
    
    List<Widget> list = new List<Widget>();

    for (String opt in options){  //hace recorrido hasta que se temine  el recorrido
      
      final tempWidget=ListTile(
        title: Text(opt),
      );

      list..add(tempWidget) //agregas los valores a la lista
          ..add(Divider());
    }
      
    return list;
  }

  List<Widget> _creatItemsShort(){

    var  widgets=options.map(  ( item ){ //regresa una nueva lista con elementos de la funcion f
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.visibility), // colocar icono al lado izqueiro del itulo
            title: Text( item +"!"),
            subtitle: Text("Cualquier cosa") ,
            trailing: Icon(Icons.keyboard_arrow_right), // colocar icono al lado derecho del itulo
            onTap:(){} , //para poder hacer click en los elementos de la lista 
          ),
          Divider()
        ],
      );
      
    }).toList(); //lo convierte en una lista

    return widgets;
  }

}