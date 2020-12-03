import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_palestine/view/bottomScreen/bottomNavigationScreens.dart';
import 'package:united_palestine/view/forgetpassword/forgetpassword.dart';
import 'package:united_palestine/view/signup/signup_screen.dart';
import 'file:///D:/Projects/united_palestine1/lib/view/bottomScreen/updates_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:united_palestine/widgets/CustomToast.dart';
import 'package:united_palestine/utils/AnimatedPageRoute.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoggingIn = false;

  getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('loggedIn');
  }

  isLoggedIn(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', loggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildBackgroundImage(context),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height:64),
                    buildLogoContent(),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: buildForm(context),
                    ),
                    buildBottomText(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomText(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => SignupScreen()));
            },
            child: Text("New here? Sign up")),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => ForgetPasswordScreen()));
          },
          child:
              Text("Forgot Password?", style: TextStyle(color: Colors.black)),
        )
      ],
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
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty) return 'Please enter some text';
                return null;
              },
              //initialValue: "password",
              obscureText: true,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red[900])),
                  hintText: "Password",
                  fillColor: Colors.red[900],
                  suffixIcon: Icon(
                    Icons.info,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isLoggingIn = true;
                        });
                        if (isLoggingIn) {
                          _signInWithEmailAndPassword(context);
                        }
                      }
                    },
                    color: isLoggingIn ? Colors.red[400] : Colors.red[900],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50)),
                    child: !isLoggingIn
                        ? const Text('SIGN IN',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                        : const Text('Signing In..',
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

  void _signInWithEmailAndPassword(BuildContext context) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ))
          .user;
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => BottomNavigationScreens()));
      } else {
        setState(() {
          isLoggingIn = false;
        });
      }
      if (!user.emailVerified) {}
    } catch (e) {
      customToast(text: e.toString());
      setState(() {
        isLoggingIn = false;
      });
    }
  }
}
