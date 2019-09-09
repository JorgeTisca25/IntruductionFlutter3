import 'package:flutter/material.dart';
//our imports
import 'package:flutter_components/src/pages/alert_pages.dart';
import 'package:flutter_components/src/pages/animated_container.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_components/src/pages/listview_page.dart';
import 'package:flutter_components/src/pages/slider_page.dart';



Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String,WidgetBuilder>{
        "/" :(BuildContext context){ ///es el home
          return HomePage();
        },
        "alert" :(BuildContext context){
          return AlertPage();
        },
        "avatar" :(BuildContext context){
          return AvatarPage();
        },
        "card"  :(BuildContext context){
          return CardPage();
        },
        "animateContainer":(BuildContext context){
          return AnimatedContainerPage();
        },
        "inputs":(BuildContext context){
          return InpuntPage();
        }
        ,
        "slider":(BuildContext context){
          return SliderPage();
        },
        "list":(BuildContext context){
          return ListaPage();
        }
      };

}