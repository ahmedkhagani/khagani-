import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/mapset.dart';
import 'package:flutter_app_44/services/auth.dart';
import 'package:flutter_app_44/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/models/user.dart';

class Setter extends StatefulWidget {
  final Function sett;
  final Function setti;
  Setter({this.sett, this.setti});

  @override
  _SetterState createState() => _SetterState();
}

class _SetterState extends State<Setter> {
  final _formKey = GlobalKey<FormState>();

  String namee = '';
  var Latlng;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    //final user = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('settings'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: (val) =>
                      val == null ? 'enter a valid name' : null,
                  onChanged: (value) {
                    setState(() {
                      namee = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'name',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: RaisedButton(
                  child: Text('go to map'),
                  onPressed: ()  {


                    if (_formKey.currentState.validate()) {

                       Navigator.push(context,MaterialPageRoute(
                          builder: (context) => MapSet(
                                value: namee,
                              )));

                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
