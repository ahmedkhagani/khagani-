import 'package:flutter/material.dart';
import 'package:flutter_app_44/services/final%20score.dart';

class disease2 {
  String name;
  String symp1;
  String symp2;
  String symp3;
  String symp4;
  String rf1;
  String rf2;
  String rf3;
  String rf4;

  disease2(
    this.name,
    this.symp1,
    this.symp2,
    this.symp3,
    this.symp4,
    this.rf1,
    this.rf2,
    this.rf3,
    this.rf4,
  );
}

maindisease2({String chiefcomp}) {
  var acs = disease2('acs', 'chest pain', 'dysnea', 'vomiting', 'palpitation',
      'smoking', 'family history', 'DM', 'HTN');
  var acs2 = disease2(
      'acs',
      'left shoulder pain',
      'jaw pain',
      'left arm pain',
      'neck pain',
      'abdominal pain',
      'obesity',
      'physical inactivity',
      'alcoholism');
  var acs3 = disease2('acs', 'hiccoup', 'sweating', 'null', 'null', 'male',
      'null', 'null', 'null');
  var hf = disease2(
    'heart failure',
    'dysnea',
    'cough',
    'sputum',
    'orthopnea',
    'HTN',
    'pregnancy',
    'DM',
    'alcoholism',
  );
  var hf2 = disease2(
      'heart failure',
      'bilaterl leg edema',
      'palpitation',
      'PN dyspnea',
      'heamoptysis',
      'family history',
      'chronic heart disease',
      'physical inactivity',
      'null');
  var htn = disease2(
      'hypertension',
      'systolic BP > 140',
      'diastolic BP > 90',
      'null',
      'null',
      'alcoholism',
      'obesity',
      'physical inactivity',
      'family history');
  var arrhythm = disease2('arrhythmia', 'palpitation', 'null', 'null', 'null',
      'null', 'null', 'null', 'null');
  var dcm = disease2(
      'dilated cardiomyopathy',
      'dyspnea',
      'orthopnea',
      'PN dyspnea',
      'bilateral leg edema',
      'chest pain',
      'palpitation',
      'family history',
      'connective tissue disease');
  var hocm = disease2('HOCM', 'chest pain', 'coma', 'dyspnea', 'null',
      'family history', 'null', 'null', 'null');
  var rcm = disease2(
      'restrictive cardiomyopathy',
      'dyspnea',
      'bilateral leg edema',
      'palpitation',
      'null',
      'null',
      'null',
      'null',
      'null');
  var pericard = disease2('pericarditis', 'chest pain', 'fever', 'null', 'null',
      'null', 'null', 'null', 'null');
  var effusion = disease2('pericardial effusion', 'dyspnea', 'palpitation',
      'null', 'null', 'connective tissue disease', 'null', 'null', 'null');
  var cperi = disease2('constrictive pericarditis', 'bilateral leg edema',
      'dyspnea', 'palpitation', 'null', 'null', 'null', 'null', 'null');
  var thoraneu = disease2('thoracic aortic aneurysm', 'chest pain', 'dyspnea',
      'null', 'null', 'HTN', 'family history', 'null', 'null');
  var aodisc = disease2('aortic dissection', 'chest pain', 'null', 'null',
      'null', 'HTN', 'family history', 'null', 'null');
  var mvd = disease2('mitral valve disease', 'dyspnea', 'cough', 'sputum',
      'palpitation', 'family history', 'null', 'null', 'null');
  var mvd2 = disease2('mitral valve disease', 'chest pain',
      'bilateral leg edema', 'null', 'null', 'null', 'null', 'null', 'null');
  var avd = disease2('aortic valve disease', 'dyspnea', 'chest pain', 'coma',
      'null', 'null', 'null', 'null', 'null');
  var achd = disease2('congenital heart disease', 'dyspnea', 'cough', 'sputum',
      'fever', 'null', 'null', 'null', 'null');
  var endocar = disease2('endocarditis', 'bilateral leg edema', 'cough',
      'sputum', 'dyspnea', 'fever', 'CKD', 'null', 'null');
  var tof = disease2('TOF', 'dyspnea', 'cyanosis', 'null', 'null', 'null',
      'null', 'null', 'other cardiac problems');
  //myocarditis will be left to the internist

  var asthma = disease2('asthma', 'dyspnea', 'cough', 'wheeze', 'null',
      'family history', 'asthma', 'null', 'null');
  var copd = disease2('COPD', 'dyspnea', 'cough', 'sputum', 'heamoptysis',
      'wheeze', 'smoking', 'chronic lung disease', 'null');
  var pneumonia = disease2('pneumonia', 'dyspnea', 'fever', 'cough', 'sputum',
      'alcoholism', 'smoking', 'chronic lung disease', 'null');
  var pneumonia2 = disease2('pneumonia', 'heamoptysis', 'null', 'null', 'null',
      'null', 'null', 'null', 'null');
  var pleura = disease2('diseases of the pleura', 'dyspnea', 'chest pain',
      'fever', 'palpitation', 'cyanosis', 'null', 'null', 'null');
  var pleura2 = disease2('diseases of the pleura', 'dyspnea', 'chest pain',
      'fever', 'palpitation', 'cyanosis', 'null', 'null', 'null');
  var pleura3 = disease2('diseases of the pleura', 'dyspnea', 'chest pain',
      'fever', 'palpitation', 'cyanosis', 'null', 'null', 'null');
  var bronc = disease2('broncheictasis', 'fever', 'cough', 'sputum', 'dyspnea',
      'heamoptysis', 'chronic lung disease', 'null', 'null');
  var calung = disease2('ca lung', 'dyspnea', 'cough', 'sputum', 'heamoptysis',
      'smoking', 'chronic lung disease', 'chest pain', 'hoarseness');
  var ards = disease2('ARDS', 'dyspnea', 'cough', 'sputum', 'heamoptysis',
      'null', 'null', 'null', 'null');
  var pe = disease2('pulmonary embolism', 'dyspnea', 'chest pain',
      'heamoptysis', 'null', 'pregnancy', 'null', 'null', 'null');
  var ild = disease2('interstitial lung disease', 'dyspnea', 'cough', 'fever',
      'sputum', 'null', 'null', 'null', 'null');
  var ild2 = disease2('interstitial lung disease', 'dyspnea', 'cough', 'fever',
      'sputum', 'null', 'null', 'null', 'null');
  var ild3 = disease2('interstitial lung disease', 'dyspnea', 'cough', 'fever',
      'sputum', 'null', 'null', 'null', 'other respiratory problems');

  var dm = disease2('DM', 'polyuia', 'polydepsia', 'polyphagia', 'weight loss',
      'family history', 'null', 'null', 'weight gain');
  var thyrotoxicosis = disease2('thyrotoxicosis', 'palpitation', 'sweating',
      'tremer', 'insomnia', 'previous goitre', 'null', 'null', 'null');
  var thyrotoxicosis2 = disease2(
      'thyrotoxicosis',
      'weight loss',
      'increased appetite',
      'heat sensation',
      'null',
      'null',
      'null',
      'null',
      'null');
  var hypothyroidism = disease2(
      'hypothyroidism',
      'weight gain',
      'cold sensation',
      'anorexia',
      'somnlence',
      'dry skin',
      'menorrhagia',
      'null',
      'dry hair');
  var hypothyroidism2 = disease2('hypothyroidism', 'constipation', 'hoarseness',
      'bilateral leg swelling', 'null', 'null', 'null', 'null', 'null');
  var acromeg = disease2('acromegally', 'enlarged hand', 'enlarged foot',
      'enlarged nose', 'enlarged jaw', 'null', 'null', 'null', 'null');
  var prolac = disease2(
      'prolactinemia',
      'galactorrhea',
      'amenorrhea',
      'oligomenorrhea',
      'gynecomastia',
      'null',
      'decrease libido',
      'null',
      'null');
  var dinsip = disease2('diabetes insipdus', 'polyuria', 'polydepsia', 'null',
      'null', 'null', 'null', 'null', 'null');
  var hyperpth = disease2('hyperparathyroidism', 'polyuria', 'polydepsia',
      'bone pain', 'null', 'null', 'null', 'null', 'null');
  var malerep = disease2('male reproductive problems', 'delayed puberty',
      'gynecomastia', 'null', 'null', 'null', 'null', 'null', 'null');
  var pcos = disease2('PCOS', 'menorrhagia', 'female hirsuitism',
      'female infertility', 'obesity', 'null', 'null', 'null', 'null');
  var cushing = disease2('cushing', 'obesity', 'straie', 'obesity', 'null',
      'null', 'null', 'null', 'null');
  var cah = disease2('CAH', 'female hirsuitism', 'null', 'null', 'null', 'null',
      'null', 'null', 'null');

  var cvs = [
    acs,
    acs2,
    acs3,
    hf,
    hf2,
    htn,
    arrhythm,
    dcm,
    hocm,
    rcm,
    pericard,
    effusion,
    cperi,
    thoraneu,
    aodisc,
    mvd,
    mvd2,
    avd,
    achd,
    endocar,
    tof
  ];
  var resp = [
    asthma,
    copd,
    pneumonia,
    pneumonia2,
    pleura,
    pleura2,
    pleura3,
    bronc,
    calung,
    ards,
    pe,
    ild,
    ild2,
    ild3
  ];
  var endo = [
    dm,
    thyrotoxicosis,
    thyrotoxicosis2,
    hypothyroidism,
    hypothyroidism2,
    acromeg,
    prolac,
    dinsip,
    hyperpth,
    malerep,
    pcos,
    cushing,
    cah
  ];
  var i = 0;
  var ii = cvs.length;
  var j = 0;
  var jj = resp.length;
  var e = 0;
  var ee = endo.length;
  var cvssym = [
    cvs[i].symp1,
    cvs[i].symp2,
    cvs[i].symp3,
    cvs[i].symp4,
    cvs[i].rf1,
    cvs[i].rf2,
    cvs[i].rf3,
    cvs[i].rf4
  ];
  var cvskey = 0;
  var cvslen = cvssym.length;
  var respsym = [
    resp[j].symp1,
    resp[j].symp2,
    resp[j].symp3,
    resp[j].symp4,
    resp[j].rf1,
    resp[j].rf2,
    resp[j].rf3,
    resp[j].rf4
  ];
  var respkey = 0;
  var resplen = respsym.length;
  var endosym = [
    endo[e].symp1,
    endo[e].symp2,
    endo[e].symp3,
    endo[e].symp4,
    endo[e].rf1,
    endo[e].rf2,
    endo[e].rf3,
    endo[e].rf4
  ];
  var endokey = 0;
  var endolen = endosym.length;
  //var chiefcomp='chest pain';
  var others = ['sputum', 'palpitation'];
  var o = 0;
  var oo = others.length;
  var riskf = ['smoking', 'DM'];
  var r = 0;
  var rr = riskf.length;
  var cvsscore = 0;
  var respscore = 0;
  var endoscore = 0;
  while (ii > 0) {
    while (cvslen > 0) {
      if (chiefcomp == cvssym[cvskey]) {
        cvsscore += 10;
      }
      //if(chiefcomp=='chest pain'||chiefcomp=='arm pain'||chiefcomp=='jaw pain'||chiefcomp=='shoulder pain'){
      //cvsscore+=4;
      //}
      while (oo > 0) {
        if (others[o] == cvssym[cvskey]) {
          cvsscore += 1;
        }
        o += 1;
        oo -= 1;
      }
      while (rr > 0) {
        //if (riskf[r]=='DM'||riskf[r]=='HTN'||riskf[r]=='family history'){
        //cvsscore+=2;
        //}
        if (riskf[r] == cvssym[cvskey]) {
          cvsscore += 1;
        }
        r += 1;
        rr -= 1;
      }
      cvslen -= 1;
      cvskey += 1;
      o = 0;
      oo = others.length;
      r = 0;
      rr = riskf.length;
    }
    i = i + 1;
    ii -= 1;
    if (ii > 0) {
      cvssym = [
        cvs[i].symp1,
        cvs[i].symp2,
        cvs[i].symp3,
        cvs[i].symp4,
        cvs[i].rf1,
        cvs[i].rf2,
        cvs[i].rf3,
        cvs[i].rf4
      ];
      cvskey = 0;
      cvslen = cvssym.length;
    }
  }
  while (jj > 0) {
    while (resplen > 0) {
      if (chiefcomp == respsym[respkey]) {
        respscore += 10;
      }
      while (oo > 0) {
        if (others[o] == respsym[respkey]) {
          respscore += 1;
        }
        o += 1;
        oo -= 1;
      }
      while (rr > 0) {
        if (riskf[r] == respsym[respkey]) {
          respscore += 1;
        }
        r += 1;
        rr -= 1;
      }
      o = 0;
      oo = others.length;
      r = 0;
      rr = riskf.length;
      resplen -= 1;
      respkey += 1;
    }
    j += 1;
    jj -= 1;
    if (jj > 0) {
      respsym = [
        resp[j].symp1,
        resp[j].symp2,
        resp[j].symp3,
        resp[j].symp4,
        resp[j].rf1,
        resp[j].rf2,
        resp[j].rf3,
        resp[j].rf4
      ];
      respkey = 0;
      resplen = respsym.length;
    }
  }
  while (ee > 0) {
    while (endolen > 0) {
      if (chiefcomp == endosym[endokey]) {
        endoscore += 10;
      }
      while (oo > 0) {
        if (others[o] == endosym[endokey]) {
          endoscore += 1;
        }
        o += 1;
        oo -= 1;
      }
      while (rr > o) {
        if (riskf[r] == endosym[endokey]) {
          endoscore += 1;
        }
        r += 1;
        rr -= 1;
      }
      o = 0;
      oo = others.length;
      r = 0;
      rr = riskf.length;
      endolen -= 1;
      endokey += 1;
    }
    e += 1;
    ee -= 1;
    if (ee > 0) {
      endosym = [
        endo[e].symp1,
        endo[e].symp2,
        endo[e].symp3,
        endo[e].symp4,
        endo[e].rf1,
        endo[e].rf2,
        endo[e].rf3,
        endo[e].rf4
      ];
      endokey = 0;
      endolen = endosym.length;
    }
  }
  finalscore.cvsscore = cvsscore;
  finalscore.respscore = respscore;
  finalscore.endoscore = endoscore;
}
