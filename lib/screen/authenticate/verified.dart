import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/home.dart';
import 'package:flutter_app_44/screen/home/wrapper.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'dart:async';

class Verified extends StatefulWidget {
  @override
  _VerifiedState createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {
  final AuthService _auth = AuthService();
  bool _emailverified = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    Future(() async {
      _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
        await FirebaseAuth.instance.currentUser
          ..reload();
        var user = FirebaseAuth.instance.currentUser;
        if (user.emailVerified) {
          setState(() {
            _emailverified = user.emailVerified;
            verified.verify = user.emailVerified;
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
        backgroundColor: Colors.pinkAccent,
        title: Text('verify your email'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'if you has verified your email click below',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            RaisedButton(
              child: Text('verify'),
              onPressed: () {
                if (FirebaseAuth.instance.currentUser.emailVerified) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Wrapper()));
                }
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Did not receive an email for verification , click below',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            RaisedButton(
              child: Text('resend'),
              onPressed: () async {
                await AuthService().resendemail();
              },
            )
          ],
        ),
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
