import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/auth.dart';

class Updatepass extends StatefulWidget {
  @override
  _UpdatepassState createState() => _UpdatepassState();
}

class _UpdatepassState extends State<Updatepass> {
  String newpass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('update'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'the new password'),
              onChanged: (value) {
                newpass = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(onPressed: () {
              AuthService().update_pass(newpass);
              Navigator.pop(context);
            },child: Text('update your password'),),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
