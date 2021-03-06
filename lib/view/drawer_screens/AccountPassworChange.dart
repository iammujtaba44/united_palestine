import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:united_palestine/project_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:united_palestine/model/UserModel.dart';
import 'package:united_palestine/services/Constants.dart';
import 'package:united_palestine/services/database.dart';
import 'package:united_palestine/view/signin/signin.dart';
import 'package:united_palestine/widgets/CustomToast.dart';
import 'package:united_palestine/model/UserModel.dart';

class AccountPasswordChange extends StatefulWidget {
  @override
  _AccountPasswordChangeState createState() => _AccountPasswordChangeState();
}

class _AccountPasswordChangeState extends State<AccountPasswordChange> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseService database = DatabaseService(uId: Constants.userId);
  final CollectionReference userdata =
      FirebaseFirestore.instance.collection('user');
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _CPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserModel user;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: _height * 0.08,
          title: Text('Change Password'),
          backgroundColor: ProjectTheme.projectPrimaryColor,
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: database.userStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              List<UserModel> use = snapshot.data;
              int index = 0;
              for (int i = 0; i < use.length; i++) {
                if (Constants.user.email == use[i].email) {
                  index = i;
                  break;

                }
              }
              UserModel data = snapshot.data[index];
              return Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                          //initialValue: "password",
                          obscureText: true,
                          controller: _oldPasswordController,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red[900])),
                              hintText: "Enter old Password",
                              fillColor: Colors.red[900]),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                          //initialValue: "password",
                          obscureText: true,
                          controller: _newPasswordController,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red[900])),
                              hintText: "Enter New Password",
                              fillColor: Colors.red[900]),
                        ),
                        Container(
                          width: _width / 1.1,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.1),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                          //initialValue: "password",
                          obscureText: true,
                          controller: _CPasswordController,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red[900])),
                              hintText: "Confirm New Password",
                              fillColor: Colors.red[900]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 60),
                          width: 250,
                          child: FlatButton(
                            color: Colors.red[900],
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(10),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(50)),
                            child: const Text('Change Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20)),
                            onPressed: () async {
                              print(data.password);
                              if (_formKey.currentState.validate()) {
                                if (_oldPasswordController.text == data.password )
                                {if (_oldPasswordController.text !=_newPasswordController.text ){
                                  if (_newPasswordController.text ==
                                      _CPasswordController.text) {
                                    Constants.user
                                        .updatePassword(
                                            _newPasswordController.text.trim())
                                        .then((_) async {
                                      await userdata
                                          .doc(Constants.user.uid)
                                          .update({
                                        'password':
                                            _newPasswordController.text.trim()
                                      });
                                      customToast(text: "Successfully changed");

                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setBool('loggedIn', false);
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          SigninScreen.routeName,
                                          (route) => false);
                                      _auth.signOut();
                                    });
                                  }
                                  else {
                                    customToast(text: "Password not matched");
                                  }}
                                  else {
                                    customToast(text: "Old and New Password can't be same");
                                }

                                }
                                else {customToast(text: "Old Password not same");}

                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
