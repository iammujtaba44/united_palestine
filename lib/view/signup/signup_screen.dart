import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_palestine/project_theme.dart';
import 'package:united_palestine/view/signin/signin.dart';
import 'package:united_palestine/view/updates/updates_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:united_palestine/widgets/CustomToast.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  DateTime _dateTime;

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
        SizedBox(height: 16),
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

  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggingIn = false;

  bool _isSuccess;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: true,
          body: Stack(
            children: [
              buildBackgroundImage(context),
              SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  children: [
                    Center(child: buildSplashContents()),
                    Container(
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      // begin: Alignment.topRight,
                      // end: Alignment.bottomLeft,
                      // colors: [
                      //   Colors.white24,
                      //   Colors.white24,
                      //   Colors.white24,
                      //   Colors.white24
                      // ]),
                      //   ),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.white,
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          height: 500,
                          width: 270,
                          child: Center(
                              child: Form(
                            key: _formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.zero,
                                            boxShadow: [
                                              // BoxShadow(color: Colors.white),
                                            ]),
                                        child: TextFormField(
                                          controller: _emailController,
                                          //key: _formKey,
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              border: UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Colors.red[900])),
                                              hintText: 'Email Address',
                                              hintStyle: TextStyle(
                                                  color: Colors.red[900])),
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.zero,
                                        boxShadow: [
                                          //BoxShadow(color: Colors.white),
                                        ]),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText: "First Name",
                                          hintStyle: TextStyle(
                                              color: Colors.red[900])),
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.zero,
                                        boxShadow: [
                                          // BoxShadow(color: Colors.white),
                                        ]),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText:
                                              "Last Name                                       \*"),
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.zero,
                                        boxShadow: [
                                          // BoxShadow(color: Colors.white),
                                        ]),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText:
                                              "Password                                         \*"),
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                      obscureText: true,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.zero,
                                        boxShadow: [
                                          // BoxShadow(color: Colors.white),
                                        ]),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText:
                                              "Confirm Password                          \*"),
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                      obscureText: true,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('Date picker function clicked');
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2021))
                                          .then((value) {
                                        setState(() {
                                          _dateTime = value;
                                        });
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.zero,
                                          boxShadow: [
                                            // BoxShadow(color: Colors.white),
                                          ]),
                                      child: TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            hintText: _dateTime
                                                    ?.toString()
                                                    ?.substring(0, 10) ??
                                                "Date of Birth",
                                            suffixIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: ProjectTheme
                                                  .projectPrimaryColor,
                                              size: 30,
                                            )),
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: FlatButton(
                                      // onPressed: () {

                                      //  // Navigator.push(context, MaterialPageRoute(builder:(ctx)=> SigninScreen()));
                                      // },
                                      color: isLoggingIn
                                          ? Colors.red[400]
                                          : Colors.red[900],
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(10),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(50)),
                                      child: !isLoggingIn
                                          ? const Text('Sign Up',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20))
                                          : const Text('Signing Up..',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20)),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            isLoggingIn = true;
                                          });
                                          if (isLoggingIn) {
                                            _registerAccount(context);
                                          }
                                        }
                                        //      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> Updatescreen() ));

                                        // _registerAccount();
                                      },
                                    ),
                                  ),
                                ]),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          )),
    );
  }

  void _registerAccount(BuildContext context) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ))
          .user;

      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Updatescreen()));
      } else {
        setState(() {
          isLoggingIn = false;
        });
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black);
      setState(() {
        isLoggingIn = false;
      });
    }
  }
}
