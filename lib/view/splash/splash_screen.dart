import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_palestine/view/signin/signin.dart';
import 'package:united_palestine/view/signup/signup_screen.dart';
import 'package:united_palestine/view/updates/updates_screen.dart';
import 'package:united_palestine/utils/AnimatedPageRoute.dart';

class SplashScreen extends StatelessWidget {
  Widget buildFAB(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.red[900],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => SignupScreen()));
        });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();

      final prefsIsLogin = prefs.getBool('loggedIn');
      if (prefsIsLogin != null) {
        if (prefsIsLogin) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => Updatescreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => SigninScreen()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => SigninScreen()));
      }
      // 5s over, navigate to a new page
    });
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          buildBackgroundImage(context),
          Center(child: buildSplashContents()),
        ]),
      ),
    );
  }

  Widget buildBackgroundImage(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: _screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.jpeg"),
                fit: BoxFit.cover)));
  }

  Widget buildSplashContents() {
    TextStyle _unitedTextStyle =
        TextStyle(fontSize: 32, fontWeight: FontWeight.w400);
    TextStyle _palestineTextStyle = TextStyle(
        fontSize: 32, fontWeight: FontWeight.w400, color: Colors.red[900]);
    TextStyle _subTextStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo.png")))),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "UNITED ",
              style: _unitedTextStyle,
            ),
            Text(
              "PALESTINE",
              style: _palestineTextStyle,
            )
          ],
        ),
        SizedBox(height: 8),
        Text(
          "One Nation, stronger together",
          style: _subTextStyle,
        )
      ],
    );
  }
}
