import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn({this.toggle});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formkey=GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error='';

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          FlatButton.icon(
              onPressed: (){
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
            child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              validator: (value) => value=null?'enter a valid email':null,
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
              validator: (value)=> value.length<6?'enter a valid passwoed':null,
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
                onPressed: ()async {
                  if (_formkey.currentState.validate())  {
                    dynamic result = await _auth.signinwithemailandpassword(email, password);
                    if (result==null){
                      setState(() {
                        error='enter valid email and password';
                      });
                    }
                  }
                }),
            SizedBox(height: 20.0,),
            Text(error,style: TextStyle(color: Colors.green),),
          ],
        )),
      ),
    );
  }
}
