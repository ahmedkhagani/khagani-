import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';
import 'package:flutter_app_44/screen/authenticate/register.dart';
import 'package:flutter_app_44/screen/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showsignin = true;

  void toggle() {
    setState(() {
      return showsignin = !showsignin;
    });
  }
  bool gotomap = false;
  void map (){
    setState(() {
      return gotomap = !gotomap;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return Container(
        child: SignIn(toggle: toggle),
      );
    } else {
      if (!gotomap){
        return Container(
          child: Register(toggle: toggle,map: map,),
        );
      }else
      return Container(child: Maps(map: map,),);
    }
  }
}
