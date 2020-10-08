import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_44/models/user.dart';
import 'package:flutter_app_44/services/database.dart';

class AuthService {

  static bool verified;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signinanon() async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerwithemailandpassword(
      String email,
      String password,
      String name,
      double Lat,
      double lng,
      String speciality,
      String city) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      await DatabaseService(uid: user.uid)
          .updateuserdata(name, Lat, lng, speciality, city);
      await user.sendEmailVerification();



      return _userfromfirebaseuser(user);
    } catch (e) {


      print(e.toString());
      print('an error occured during email verification');
      return null;
    }
  }

  Future signinwithemailandpassword(String email, String password) async {
    try {

        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        User user = result.user;

        return _userfromfirebaseuser(user);




    } catch (e) {
      print(e.toString());
      print('verify your email address');
      return null;
    }
  }
  bool isemailverified(){
    if (FirebaseAuth.instance.currentUser.emailVerified){
      verified=true;
      return verified;
    }
  }



  Future<void> update_pass(String pass) async {

      User user = await FirebaseAuth.instance.currentUser; 
      user.updatePassword(pass);

  }
  // this function wiil return user
  Users _userfromfirebaseuser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }
  // will return madry shno//but it had been made in the beginning of the series and wrapped the main function
  Stream<Users> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userfromfirebaseuser(user));
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  validateCurrentPassword(String password) async {
    return await AuthService().validatePassword(password);
  }

  Future<bool> validatePassword(String password) async {
    User user = await _auth.currentUser;

    AuthCredential credentialss =
        EmailAuthProvider.credential(email: user.email, password: password);
    try {
      UserCredential cred =
          await user.reauthenticateWithCredential(credentialss);
      return cred.user != null;
    } catch (e) {
      print(e);
      return false;
    }


  }
  verifyyouremail(String email,String password)async{
    return await AuthService().verifyemail(email, password);
  }
  Future<bool> verifyemail(String email,String password)async{
    User user = await _auth.currentUser;
    AuthCredential credentiality=await EmailAuthProvider.credential(email: email, password: password);
    try{
      UserCredential credi= await user.reauthenticateWithCredential(credentiality);
        return credi.user !=null;
    }
    catch(e){
      print(e);
      return false;
    }
  }

  resendemail()async{
    User user = FirebaseAuth.instance.currentUser;
    try{
      await user.sendEmailVerification();
    }
    catch(e){
      print(e);
      return null;
    }

  }
  /*var uid = FirebaseAuth.instance.currentUser.uid;
  deletedata(uid)async {
    return await DatabaseService(uid: uid).deletedata(uid);
  }*/
}



//register method is very important
