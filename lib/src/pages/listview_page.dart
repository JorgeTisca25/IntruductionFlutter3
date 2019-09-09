import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

ScrollController _scrollController=new ScrollController();
bool _isLoading=false; //cambiara cuando se active el fetchData
List<int> _numberList = [];
int _lastItem=0;



@override
  void initState() { //este metodo iniializa  
    // TODO: implement initState
    super.initState();
    _addItem10();

    _scrollController.addListener((){
      //print("SCROOOL!!");

      if(_scrollController.position.pixels== _scrollController.position.maxScrollExtent){ //maxxscrol es el maximo de pixeles
        //_addItem10();  //se actualiza hasta que baje 
        fetchDate();
      }
    });
  }

  @override
  void dispose() { //cuando la pagina es destriuida y deja de existir, se vacia
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text("Listas")
         ),
         body: Stack(  //uno encima de otro
           children: <Widget>[
            _creatList(),
            _creatLoading(),
           ],
         )
         
         
         
    );
  }

  Widget _creatList(){
    
    return RefreshIndicator( // para actualizar cuano le das hasta arriba a la pantalla

        onRefresh: getPage1,

        child: ListView.builder(
        controller: _scrollController,//para controlar el scroll y establecer el valor y mover de posicion
        itemCount: _numberList.length, //cuantos elementos se tiene en la lista
        itemBuilder: (BuildContext context, int index){     ///la forma en que se dibujara el widget
          final image= _numberList[index];//posiciones de la lista
          return FadeInImage( ///para cargar de un recurso externo
          
            image: NetworkImage("https://picsum.photos/id/500/400/?image=$image"),
            placeholder: AssetImage("assets/sharingan.gif"),
          ); 
        } ,
      ),
    );

  }
  void _addItem10(){

    for (var i=1; i<10; i++){
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {
      
    });
  }

  Future fetchDate() async{ ///para poder usar el await se coloca el async
  _isLoading=true;
  setState(() {
    
  });

  final duration= new Duration(seconds: 2);
  return new Timer(duration,answerHTTP);
  }
  void answerHTTP(){
    _isLoading=false;   
    _scrollController.animateTo(   ///mover la imagen un poco mas arriba cuando esta ya cargada
      _scrollController.position.pixels +100,
      curve:  Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _addItem10();
  }

   Widget _creatLoading() { // animacion de loading
     if(_isLoading){
       return Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               CircularProgressIndicator()
             ],
           ),
           SizedBox(height:15.0)
           
         ],
       );
       

     }else{
       return Container();
     }
  }

  Future<Null> getPage1()async{ // para limpiar al recargar hacia arriba
    final duration= new Duration(seconds: 2);
     new Timer (duration,(){
      _numberList.clear();
      _lastItem++;
      _addItem10(); //para que cargue nuevas imagenes
    });
    return Future.delayed(duration);//esperar 2 segundos
  }
}