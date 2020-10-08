import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/models/user.dart';
import 'package:flutter_app_44/screen/authenticate/authenticate.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';
import 'package:flutter_app_44/screen/authenticate/verified.dart';
import 'package:flutter_app_44/screen/home/home.dart';
import 'package:flutter_app_44/screen/home/mapset.dart';
import 'package:flutter_app_44/screen/home/setter.dart';
import 'package:flutter_app_44/screen/home/the%20speciality.dart';
import 'package:provider/provider.dart';

class verified{
  static bool verify=false;
}


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user == null) {
      return Container(
        child: Authenticate(),
      );
    } else {
      if (!FirebaseAuth.instance.currentUser.emailVerified) {
        return Container(
          child:Verified() ,
        );
      } else {
        return Container(
          child: Home(),
        );
      }
    }

  }
}




