import 'package:flutter/cupertino.dart';
import 'package:flutter_app_44/services/symptoms.dart';
import 'package:flutter_app_44/services/symptom2.dart';

class finalscore {
  static int scorrrr;
  static int cvsscore;
  static int respscore;
  static int endoscore;
  static String specialities;
}

countthe() {
  var finals = {
    finalscore.cvsscore: 'cardiologist',
    finalscore.respscore: 'pulmonologist',
    finalscore.endoscore: 'endocrinologist'
  };
  var finallist = [
    finalscore.cvsscore,
    finalscore.respscore,
    finalscore.endoscore
  ];
  int finallscore = 0;
  String speciality = '';
  var x = 0;
  var xx = finallist.length;
  while (xx > 0) {
    if (finallist[x] > finallscore) {
      finallscore = finallist[x];
      speciality = finals[finallist[x]];
    }
    x += 1;
    xx -= 1;
  }
  finalscore.specialities = speciality;
}
