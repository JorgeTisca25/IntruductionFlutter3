import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_pages.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),

      body: 
      
      _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future:menuProvider.cargarData(),
      initialData: [],
      builder:(BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        
        //print("builder");
       // print(snapshot.data);
        
        return ListView(
          children: _listaItems(snapshot.data, context),
        );



      } , //es obligatoria
    );
   
   // print(menuProvider.options);
   /* menuProvider.cargarData().then((options){   //

      print("_lista");
      print(options);

    });
    return ListView(
      children: _listaItems(),
    );*/
  }



  List<Widget> _listaItems(List<dynamic> data,BuildContext context) {
    final List<Widget> options=[];
   

    data.forEach((opt){
      final widgetTemp=ListTile(
        title: Text(opt["texto"]), ///mostrara lo que hay en nuestro json
        
        leading: getIcon(opt["icon"]),// iconos manda a llamar el icono por un json
        //leading:  Icon(Icons.keyboard_arrow_right, color:Colors.blue),
        trailing: Icon(Icons.keyboard_arrow_right, color:Colors.blue),
        onTap: (){

          Navigator.pushNamed(context, opt["ruta"]) ;// Este navigator es mas senicillo, ya que toma un string para poder hubicar la vista---Este tiene que estar difinido en el main de las rutas 
          



          //final route= MaterialPageRoute( //toma la ruta para la cual se ira
          //  builder: (context){  //toma el contexto
          //    return AlertPage();// agarra la pantalla a donde se ira    
          //  }
          //);
          //Navigator.push(context, route); /// cambiar de pantalla  --el context es para saber que pagina sigue (tambien sirve para tener informacion global) y cual regresar ,    --- 
          //el context lo toma del List---- el context es de la pantalla actual y la el route de a pagina a la que ira

        },
      );
      options..add(widgetTemp)
              ..add(Divider());

    
    });
    return options;
  }
}