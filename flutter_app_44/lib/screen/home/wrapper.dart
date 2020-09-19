import 'package:flutter/material.dart';
import 'package:flutter_app_44/models/user.dart';
import 'package:flutter_app_44/screen/authenticate/authenticate.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';
import 'package:flutter_app_44/screen/home/home.dart';
import 'package:flutter_app_44/screen/home/mapset.dart';
import 'package:flutter_app_44/screen/home/setter.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool settings = true;

  void sett() {
    setState(() {
      return settings = !settings;
    });
  }

  bool setter=true;
  void setti(){
    setState(() {
      return setter=!setter;
    });
  }
  @override
  Widget build(BuildContext context) {

      final user = Provider.of<Users>(context);
      if (user == null ){
        return  Container(child: Authenticate(),);
      }else{
        if (!settings){
          if (setter){
            return Container(child: Setter(sett: sett,setti: setti,),);
          }else{
            return Container(child: MapSet(setti: setti,sett: sett,),);
          }

        }else{
          return Container(child: Home(sett: sett,),);

        }

      }
  }
}
