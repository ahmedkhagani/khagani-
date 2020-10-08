import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/authenticate/forgetpassword.dart';
import 'package:flutter_app_44/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn({this.toggle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

  String emaili = '';
  String password = '';
  String error = '';

  bool emailverified ;
  Timer _timer;

  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
    Future(()async{
      _timer = Timer.periodic(Duration(seconds:10), (timer)async{
        await FirebaseAuth.instance.currentUser..reload();
        var user= FirebaseAuth.instance.currentUser;
        if (user.emailVerified){
          setState(() {
            emailverified=user.emailVerified;
          });
          timer.cancel();
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggle();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value = null ? 'enter a valid email' : null,
                    onChanged: (value) {
                      setState(() {
                        emaili = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value.length < 6 ? 'enter a valid passwoed' : null,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Sign in ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                          dynamic result = await _auth
                              .signinwithemailandpassword(emaili, password);
                          if (_formkey.currentState.validate()) {
                            if (result == null) {
                              setState(() {
                                error = 'enter valid email and password';
                              });
                            }
                          }
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgetPass()));
                    },
                    child: Text(
                      'Forget password',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}

