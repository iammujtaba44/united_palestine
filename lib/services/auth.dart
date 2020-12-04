import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_palestine/services/Constants.dart';
import 'package:united_palestine/services/database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      {@required String email,
      @required String password,
      @required String firstname,
      @required String lastname,
      @required String bdate}) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      print(user.uid);
      await DatabaseService(uId: user.uid).UserData(
          email: email,
          password: password,
          firstname: firstname,
          lastname: lastname,
          bdate: bdate);
      Constants.user = user;
    Constants.userId = user.uid;
      return user;
    } catch (e) {
      //Constants.isLoading = false;
      // customToast(text: e.toString());
      print(e.toString());
      return null;
    }
  }
}
