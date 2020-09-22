import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/screen/authenticate/authenticate.dart';
import 'package:flutter_app_44/screen/authenticate/map.dart';

class Register extends StatefulWidget {
  final Function toggle;
  final Function map;

  Register({
    this.toggle,
    this.map,
  });

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  String name = '';
  String speciality='';
  String city='';

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          FlatButton.icon(
            onPressed: () {

            },
            icon: Icon(Icons.person),
            label: Text('Sign in'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'email address',
                    ),
                    validator: (val) =>
                        val == null ? 'enter a valid email' : null,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'password',
                    ),
                    validator: (val) =>
                        val.length < 6 ? 'enter a valid password' : null,
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
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'speciality',
                    ),
                    onChanged: (value) {
                      setState(() {
                        speciality = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'current city',
                    ),
                    onChanged: (value) {
                      setState(() {
                        city = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Go to Google map ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Maps(
                                    email: email,
                                    password: password,
                                    name: name,
                                    speciality: speciality,
                                    city: city,
                                  )));
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
