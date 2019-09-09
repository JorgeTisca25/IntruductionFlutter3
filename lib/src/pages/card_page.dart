import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),//Es una distancia entre los bordes hacia dentro --- all es un pading en todas las direcciones
        //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical:30.0),/// solo lo mueve de forma horizontal  y/o vrtival
        children: <Widget>[
          _cardTipo1(), //tarjeta
          SizedBox(height: 30.0), //espacio entre tarjeta
          _cardTipo2(), //tarjeta
          SizedBox(height: 30.0), //espacio entre tarjeta
          
        ],
      ),
    );
  }


  Widget _cardTipo1(){
    return Card(
      elevation: 15.0,//que tan alta la tarjeta estara /sombra
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), //borde de la card
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color:Colors.purple),
            title:  Text("Ejemplo de tarjeta"),
            subtitle: Text("Buen dia, un gran poder lleva a una gran resposnabilidad :P  :v"),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(){
    //  clipBehavior: Clip.antiAlias, //nos ayudara ah que nada de la tarjeta se slaga del contenido
    final card =  Container( //se cambio el card por container para ver diferencias
      child:  Column(
        children: <Widget>[

          FadeInImage( ///imagen de cargando mientras se carga imagen 
            image: NetworkImage("https://vignette.wikia.nocookie.net/naruto-shippuden-latino/images/4/42/Sasuke_Mangekyo_Sharingan_Eterno.jpg/revision/latest?cb=20130316182557&path-prefix=es"),
            placeholder:  AssetImage("assets/sharingan.gif") ,///mostrar gift de loading
            fadeInDuration: Duration(milliseconds:200) ,// duracion en cargar la imagen
            height: 200.0 ,//ancho imagen    
            fit: BoxFit.cover //sirve para indicar como la iagen debe de ocuapr el espacio
          ),

          //Image(
          //  image: NetworkImage("https://vignette.wikia.nocookie.net/naruto-shippuden-latino/images/4/42/Sasuke_Mangekyo_Sharingan_Eterno.jpg/revision/latest?cb=20130316182557&path-prefix=es"),
          //),

          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("!!!!!!!!AMATERASU!!!!!!!!")
            
          )
        ],
      ) ,
    );

    return Container( // guardas la tarjeta en un contenedor y esta sepuede modificar
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0 ),
        color: Colors.purple,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color:Colors.black,
            blurRadius: 20.0,
            spreadRadius:4.0,//extencion de sombra
            offset: Offset(4.0,10.0) //posicion de sombra 
          )
          

        ]
      ),  
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60.0),
        child: card,
      ),//permite cortar lo que hay fuera del contenedor 
    );

  }



}