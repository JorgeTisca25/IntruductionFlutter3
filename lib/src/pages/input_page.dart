import 'package:flutter/material.dart';

class InpuntPage extends StatefulWidget {

  


   _InpuntPageState createState() =>  _InpuntPageState();
}

class  _InpuntPageState extends State <InpuntPage> {
  String _nombre="";
  String _email="";
  String _password;
  String _fecha="";
  String _opcionseleccionada="volar";

  List<String> _poderes=["volar", "Rayos X", "Super aliento","Super fuerza", "Sharingan XD"];

  TextEditingController _inputFildDateController= new TextEditingController(); //esta propiedad maneja una realacion con caja de texto para asignar valores 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Inputs de Texto"),
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
         children: <Widget>[
           _crearInput(),
           Divider(),
           _crearEmail(),
           Divider(),
           _crearPassword(),
           Divider(),
           _crearFecha(context),
           Divider(),
           _crearDropDown(),
           Divider(),
           _crearPersona(),
         ],
       ),
    );
  }

  Widget _crearInput() {
    
    return TextField(
      //autofocus:true ,//autofocs para colocar en donde iniciara a escribir
      textCapitalization: TextCapitalization.sentences,//empezar con mayusculas
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) //borde
        ),
        counter: Text("Letras ${_nombre.length}"),//contar letras
        hintText: "Nombre de la persona", //texto fantama
        labelText: "Nombre",
        helperText: "Solo es el nombre", //texxto de ayuda
        suffix: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){  //valor actual e la caja de text
        setState(() {   //no olovear para redibujar y colcoar cambios en tiempo real
          _nombre=valor;
          print("$_nombre");
        });
        

      },
    ) ;     
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_opcionseleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      
      keyboardType:  TextInputType.emailAddress, //cambio de teclado
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) //borde
        ),
        
        hintText: "Email", //texto fantama
        labelText: "Email",
        helperText: "Solo cuentas activas, la pirateria es mala u.u", //texto de ayuda
        suffix: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){  //valor actual e la caja de text
        setState(() {   //no olovear para redibujar y colcoar cambios en tiempo real
          _email=valor;
          print("$_email");
        });

      },
    ) ;
  } 
  Widget _crearPassword() {
    return TextField(
      
      obscureText: true,//esconde texto
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) //borde
        ),
        
        hintText: "Password", //texto fantama
        labelText: "Password",
        helperText: ":O SECRET!!!", //texxto de ayuda
        suffix: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor){  //valor actual e la caja de text
        setState(() {   //no olovear para redibujar y colcoar cambios en tiempo real
          _password=valor;
          
        });

      },
    ) ;
  }

  _crearFecha(BuildContext context){  //pare recibir contexto se utiliza el buid
    return TextField(
      controller: _inputFildDateController,//recibe el  controlador para llenar la caja de text
      enableInteractiveSelection: false, //no podra copiar informacion
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) //borde
        ),
        
        hintText: "Fecha de nacimieno", //texto fantama
        labelText: "Fecha de nacimieno",
        
        suffix: Icon(Icons.calendar_view_day),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){ ///para selector de fecha

        FocusScope.of(context).requestFocus(new FocusNode()); //para quitar el foco o donde no puedas escribir
        _selectDate(context);
      },
    ) ;
  }

   _selectDate(BuildContext context) async {
     DateTime picked=await showDatePicker(
       context: context,
       initialDate: new DateTime.now(), //para colocar desde la fecha actual
       firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
       locale: Locale("es","ES") ///para cambiarlo a español se coloca una dependenci flutter_localizacions:, y tambien importar los paquetes necesarios en el main
     ); //almacenar fecha
     if(picked != null){
       setState(() {
         _fecha=picked.toString();
         _inputFildDateController.text=_fecha; //el contolador recibe el dato de la fecha
      
       });
     }
  }



    List<DropdownMenuItem<String>>getOpcionesDropDown(){
      
      List<DropdownMenuItem<String>> lista= new List();
      
      _poderes.forEach((_poder){
        
        lista.add(DropdownMenuItem(
          child: Text(_poder), //muestra
          value: _poder,//obtiene valor
        
        ));
        //print("++XXXXXXXxxxxx"+_poder);
      });
      print(" +-------${lista[1]}" + "-------------");
      return lista;

    }
  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,), //espacio de icono  
        Expanded(
          child: DropdownButton(
              
              value:_opcionseleccionada, ///coloca valor seleccionado
              
              items: getOpcionesDropDown(),    ///esto es a fuerzas--metdo para obtener valores
              onChanged: (opt){
                setState(() {
                  _opcionseleccionada=opt;
                });
              },
            ),
        )
        
      ],
    );
    
    
    
  }
}