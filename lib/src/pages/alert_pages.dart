import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),

      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar Alerta  "),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(), //Bordes
          onPressed: (){
            _mostrarAlert(context);
          },
          
        ),
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);//cerrar ventana actual
        },
      )
    );
  }

  void _mostrarAlert(BuildContext context){ ///mostrar alert
    showDialog(
      context: context,
      barrierDismissible: true,//se cierra la alerta haciendo clic afuera
      builder:(context){        //recibe el context y te regresa un widget
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), //borde de la alerta
          //shape: BorderRadius.circular(30.0),//
          title:  Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min ,//reacomoda el tamaño de la alerta, para adptarse al contenido 
            children: <Widget>[
              Text("!!!!!!!!NOOOOOOO!!!!!"),
              FlutterLogo(size: 100)// logo de flutter 
            ],
          ),
          actions: <Widget>[
            
            FlatButton(
              child: Text("Cancelar"),
              //color:Colors.black, //cambia el color del boton
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );//mostrar alerta
  }
}