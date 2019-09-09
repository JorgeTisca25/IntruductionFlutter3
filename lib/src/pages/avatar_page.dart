import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[ //lista de widgets

          Container(
            margin:EdgeInsets.only(right:10.0),
            padding: EdgeInsets.all(3.0),//mover la imagen
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://library.kissclipart.com/20180831/jbw/kissclipart-uchiha-logo-png-clipart-madara-uchiha-sasuke-uchih-d388266a92c5a8fa.jpg"),
              radius: 25.0,//radio del circulo
            ),
          ),

          Container(
            margin:EdgeInsets.only(right:15.0),    //el conteinter coontendra el margen
            child: CircleAvatar(  //agrega un circulo en laparte derecha de la barra superior
               
              child: Text("TP"),
              backgroundColor: Colors.green,

            ),
          ) 
        ],
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://wallpaper-gallery.net/images/sasuke-uchiha-mangekyou-sharingan/sasuke-uchiha-mangekyou-sharingan-13.jpg"),
          placeholder: AssetImage("assets/sharingan.gif"),
          fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
    
    );
  }
}