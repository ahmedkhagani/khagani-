import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formkey = GlobalKey<FormState>();

  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('forget password'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "enter your profile email address"),
                onChanged: (val) {
                  email = val;
                },
                validator: (val) => val.isEmpty ? 'enter a valid email' : null,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () async{
                  if (_formkey.currentState.validate()){
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                  }
                },
                child: Text('send reset password email'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
