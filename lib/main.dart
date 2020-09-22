import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/authenticate/authenticate.dart';
import 'package:flutter_app_44/screen/home/the%20speciality.dart';
import 'package:flutter_app_44/screen/home/wrapper.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(

        home: Wrapper(),
      ),
    );
  }
}
