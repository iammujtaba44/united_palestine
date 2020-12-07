import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:united_palestine/model/UserModel.dart';
import 'package:united_palestine/project_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_palestine/services/Constants.dart';
import 'package:united_palestine/view/signin/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:united_palestine/services/database.dart';
import 'package:united_palestine/widgets/CustomToast.dart';
import 'package:united_palestine/view/drawer_screens/AccountPassworChange.dart';


// void _changePassword(String password) async{
//   //Create an instance of the current user.
//   FirebaseUser _authUser = await FirebaseAuth.instance.currentUser;
//   _authUser.updatePassword(password).then((value) => null)
//
// }

class AccountsScreen extends StatefulWidget {
  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {

  final CollectionReference userdata =
  FirebaseFirestore.instance.collection('user');
  bool isObscure = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseService database = DatabaseService(uId: Constants.userId);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final TextEditingController dater = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
          onPressed: (){Navigator.pop(context);}),
        toolbarHeight: _height * 0.08,
        title: Text('Account Setting'),
        backgroundColor: ProjectTheme.projectPrimaryColor,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: database
            .userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<UserModel> use = snapshot.data;
          int index = 0;
          for(int i = 0; i<use.length; i++){
            if(Constants.user.email == use[i].email)
            {
              index = i;
              break;
            }
          }
          UserModel data= snapshot.data[index];
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                      children: [
                        ListTile(
                          title: Text('User name/ Email',
                            style: TextStyle(color: Colors.red[900]),
                          ),
                          trailing: Text(data.email),
                        ),
                        Container(
                          width: _width / 1.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.1),
                          ),
                        ),
                        InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx)=> AccountPasswordChange()));
                                
                                
                                
                                // return Alert(
                                //     context: context,
                                //     title: "UPDATE",
                                //     content: Column(
                                //       children: <Widget>[
                                //         TextField(
                                //           controller: dater,
                                //         ),
                                //       ],
                                //     ),
                                //     buttons: [
                                //       DialogButton(
                                //         onPressed: () async {
                                //
                                //           Constants.user.updatePassword(dater.text.trim()).then((_) async{
                                //            await userdata
                                //                 .doc(Constants.userId)
                                //                 .update({'password': dater.text.trim()});
                                //          customToast(text: "Successfully changed");
                                //
                                //
                                //             final prefs = await SharedPreferences.getInstance();
                                //             await prefs.setBool('loggedIn', false);
                                //             Navigator.pop(context);
                                //             Navigator.pushReplacement(
                                //                 context, MaterialPageRoute(builder: (context) => SigninScreen()));
                                //             _auth.signOut();
                                //
                                //           });
                                //
                                //
                                //           //_authuser
                                //         },
                                //         child: Text(
                                //           "Update",
                                //           style:
                                //           TextStyle(color: Colors.white, fontSize: 20),
                                //         ),
                                //       )
                                //     ]).show();
                              },
                              child:
                              ListTile(
                                title: Text('Password',
                                  style: TextStyle(color: Colors.red[900]),
                                ),
                                trailing:  Text(
                                  isObscure == true
                                      ? data.password
                                      : '${data.password.replaceAll(RegExp(r"."), "*")}'
                              ),),



                        ),
                        Container(
                          width: _width / 1.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.1),
                          ),
                        ),
                        ListTile(
                          title: Text('Language',
                            style: TextStyle(color: Colors.red[900]),
                          ),
                          trailing: Text('English'),
                        ),
                        Container(
                          width: _width / 1.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.1),
                          ),
                        ),
                        ListTile(
                          title: Text('Notifications',
                            style: TextStyle(color: Colors.red[900]),
                          ),

                        ),
                        Container(
                          width: _width / 1.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.1),
                          ),
                        ),
                      ],
                    )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    color: Colors.red[900],
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('loggedIn', false);
                     Navigator.pushNamedAndRemoveUntil(context, SigninScreen.routeName, (route) => false);
                      _auth.signOut();
                    },
                    padding: const EdgeInsets.all(10),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50)),
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }

  final titles = [
    'User name/ Email',
    'Password',
    'Language',
    'Notifications',
  ];

  final trailing = [
    'Raheel@gmail.com',
    '********',
    'English',
    '',
  ];
}
