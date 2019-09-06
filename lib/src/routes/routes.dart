import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_pages.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';


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
        }
      };

}