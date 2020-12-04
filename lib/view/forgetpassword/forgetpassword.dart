import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:united_palestine/main.dart';

class ForgetPasswordScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildBackgroundImage(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLogoContent(),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: buildForm(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value.isEmpty) return 'Please enter some text';
                return null;
              },
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[900])),
                  hintText: "Email Address",
                  fillColor: Colors.red[900],
                  suffixIcon: Icon(
                    Icons.delete,
                    color: Colors.red[900],
                  )),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        resetPassword(_emailController.text.toString().trim());
                      }
                    },
                    color: Colors.red[900],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50)),
                    child: const Text('Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ));
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

  Widget buildLogoContent() {
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

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }
}
