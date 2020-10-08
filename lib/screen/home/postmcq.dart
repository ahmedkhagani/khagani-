import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_44/screen/home/mcqs.dart';
import 'package:flutter_app_44/services/database.dart';

class Postmcq extends StatefulWidget {
  @override
  _PostmcqState createState() => _PostmcqState();
}

class _PostmcqState extends State<Postmcq> {
  /*var qss = [
    'what is your name?',
    'what is your age?',
    'what is your hair color?',
    'what is your favorite food?'
  ];
  var map = {
    'what is your name?': ['a1', 'a2', 'a3', 'a4'],
    'what is your age?': ['aa1', 'aa2', 'aa3', 'aa4'],
    'what is your hair color?': ['ab1', 'ab2', 'ab3', 'ab4'],
    'what is your favorite food?': ['ac1', 'ac2', 'ac3', 'ac4'],
  };
  var answers = {
    'what is your name?': 'a1',
    'what is your age?': 'aa2',
    'what is your hair color?': 'ab3',
    'what is your favorite food?': 'ac4'
  };
  //===================================
  //=============dropdowns=============
  int value;
  String value2;
  int score = 0;
  int testc = mcqindex.q;
  int testcc = mcqindex.qq;
  int counter=0;
  int lenght=0;

  void selected(_value) {
    setState(() {
      mcqindex.value = map[qss[testc]][int.parse(_value)];
      print(mcqindex.value);
    });
  }

  void selected2(_value) {
    setState(() {
      mcqindex.value2 = map[qss[testc + 1]][int.parse(_value)];
      print(mcqindex.value2);
    });
  }

  getscore() {
    setState(() {
      if (mcqindex.value == answers[qss[testc]]) {
        mcqindex.score += 1;
      }
    });
    print(mcqindex.score);
  }

  getscore2() {
    setState(() {
      if (mcqindex.value2 == answers[qss[testc + 1]]) {
        mcqindex.score += 1;
      }
    });
    print(mcqindex.score);
    print(testc);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Post Questions'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              /*Center(
                child: Text(
                  qss[testc],
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Choose the right answer'),
                  items: [
                    DropdownMenuItem<String>(
                      value: '0', //map[qss[mcqindex.q]][0],
                      child: Center(
                        child: Text(map[qss[testc]][0]),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '1', //map[qss[mcqindex.q]][1],
                      child: Center(
                        child: Text(map[qss[testc]][1]),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '2', //map[qss[mcqindex.q]][2],
                      child: Center(
                        child: Text(map[qss[testc]][2]),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '3', //map[qss[mcqindex.q]][3],
                      child: Center(
                        child: Text(map[qss[testc]][3]),
                      ),
                    ),
                  ],
                  onChanged: (value) => selected(value),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text(
                  qss[testc + 1],
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Choose the right answer'),
                  items: [
                    DropdownMenuItem<String>(
                      value: '0', //map[qss[mcqindex.q]][0],
                      child: Center(
                        child: Text(map[qss[testc + 1]][0]),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '1', //map[qss[mcqindex.q]][1],
                      child: Center(
                        child: Text(map[qss[testc + 1]][1]),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '2', //map[qss[mcqindex.q]][2],
                      child: Center(
                        child: Text(map[qss[testc + 1]][2]),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '3', //map[qss[mcqindex.q]][3],
                      child: Center(
                        child: Text(map[qss[testc + 1]][3]),
                      ),
                    ),
                  ],
                  onChanged: (value22) => selected2(value22),
                ),
              ),*/
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                child: Text('Submit'),
                color: Colors.lightGreenAccent,
                onPressed: () {
                  /*getscore();
                  getscore2();
                  /*setState(() {
                  testscore -= 1;
                });*/
                  if (testcc > 2) {
                    setState(() {
                      testc += 2;
                      testcc -= 2;
                    });
                  } else {
                    setState(() {
                      testc = 0;
                      testcc = 4;
                    });
                  }
                  setState(() {
                    counter=testc;
                    lenght=testcc;
                  });
                  DatabaseService(uid: FirebaseAuth.instance.currentUser.uid)
                      .updateuserdata('010100110101', 0.0022001, 0.00005400066,
                          counter.toString(), lenght.toString());
                  print(mcqindex.q);
                  print(score);
                  print(testc);*/
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text('Update'),
                onPressed: () {
                  setState(
                    () {
                      /* if (mcqindex.score >= 4) {
                    mcqindex.score = 0;
                  }
                  print(mcqindex.q);*/
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
