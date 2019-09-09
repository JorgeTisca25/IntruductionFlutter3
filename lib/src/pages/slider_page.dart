import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider=100.0;
  bool _blockCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Siders")
        
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
           _createSlider(),
           _createCheckBox(),
           _createSwitch(),
           Expanded( ///centrado de imagen
             child:_createImage()
            ),
          ],
        ),
      ),
    );
    
  }


  Widget _createSlider() {
    
    return Slider(
      activeColor: Colors.indigoAccent, //activar color
      label: "Tamaño de la imagen",
      divisions:20, //division en puntos en slider
      value:_valueSlider,
      min:10.0,
      max: 400.0,
      onChanged:(_blockCheck) ? null: ///pequeño if que si esta activo o no el checkbox
      
      (value){//recibe el valor que tenga ese slider
        setState(() {
          _valueSlider=value;  ///para mover barra
        });
        
      } , 
    );
  }

  Widget _createImage() {
    return Image(
      
      image: NetworkImage("http://pm1.narvii.com/6320/1af1be2d296c4d2bd8dc7170651f87823a99d53b_00.jpg"),
      width: _valueSlider, ///tamaño de imagen
      fit:BoxFit.contain,//para que se adapte la imagen y se vea bien
      
    );
  }

  Widget _createCheckBox() {
    //return Checkbox(
    //  value:_blockCheck,
    //  onChanged: (value){
    //    setState(() {
    //      
    //      _blockCheck=value;
    //    });
    //    
    //  },
    //);
    //---checkbox en forma de listTitle
    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value:_blockCheck,
        onChanged: (value){
          setState(() {
            
            _blockCheck=value;
          });
        
        },

    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value:_blockCheck,
        onChanged: (value){
          setState(() {
            
            _blockCheck=value;
          });
        
        },

    );
  }
}