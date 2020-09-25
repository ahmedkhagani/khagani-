import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/updatepass2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_44/services/auth.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  String currentpassword = '';
  String pass = '';
  bool checkcurrentpassvalid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('update password'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'enter current password'),
              onChanged: (val) {
                currentpassword = val;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () async {
                AuthService().validatePassword(currentpassword);
                //var usercontroller = Locator.get<UserController>();
                checkcurrentpassvalid = await AuthService()
                    .validateCurrentPassword(currentpassword);
                if (checkcurrentpassvalid) {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Updatepass()));
                  });
                }
              },
              child: Text('update'),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
