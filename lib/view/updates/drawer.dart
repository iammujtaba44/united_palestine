import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_palestine/project_theme.dart';
import 'package:united_palestine/view/drawer_screens/idcard.dart';
import 'package:united_palestine/view/signin/signin.dart';
import 'package:united_palestine/view/drawer_screens/accounstSettings.dart';
import 'package:united_palestine/view/drawer_screens/profile.dart';
import 'package:united_palestine/view/drawer_screens/wallet.dart';
import 'package:united_palestine/utils/AnimatedPageRoute.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Drawer buildCustomDrawer(double _height, double _width, BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          height: _height / 4.5,
          decoration: BoxDecoration(
            color: ProjectTheme.projectPrimaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 6, left: 6),
                child: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: _height / 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: _width / 20,
                    ),
                    Text(
                      'Tamer Atia',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.008,
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                width: _width,
                height: _height * 0.04,
                color: Color.fromARGB(50, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ID: UP1254896312',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: _width / 6.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, AnimatedPageRoute(widget: IdCardScreen()));
                      },
                      child: Icon(
                        Icons.contact_mail_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 50, right: 50),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: ProjectTheme.projectPrimaryColor,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ProjectTheme.projectPrimaryColor,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context, AnimatedPageRoute(widget: ProfileScreen()));
                              })
                          //
                          ),
                    ],
                  ),
                ),
                Container(
                  width: _width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.wallet_membership,
                        size: 30,
                        color: ProjectTheme.projectPrimaryColor,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                              child: Text(
                                'Wallet',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ProjectTheme.projectPrimaryColor,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context, AnimatedPageRoute(widget: WalletScreen()));
                              })),
                    ],
                  ),
                ),
                Container(
                  width: _width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.all_inbox,
                        size: 30,
                        color: ProjectTheme.projectPrimaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Inbox',
                          style: TextStyle(
                            fontSize: 16,
                            color: ProjectTheme.projectPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.build_rounded,
                        size: 30,
                        color: ProjectTheme.projectPrimaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Action Center',
                          style: TextStyle(
                            fontSize: 16,
                            color: ProjectTheme.projectPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_add,
                        size: 30,
                        color: ProjectTheme.projectPrimaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Followers / Following',
                          style: TextStyle(
                            fontSize: 16,
                            color: ProjectTheme.projectPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                        color: ProjectTheme.projectPrimaryColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, AnimatedPageRoute(widget: AccountsScreen()));
                          },
                          child: Text(
                            'Account Settings',
                            style: TextStyle(
                              fontSize: 16,
                              color: ProjectTheme.projectPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.3),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('loggedIn', false);
                    Navigator.pushReplacement(
                        context, AnimatedPageRoute(widget: SigninScreen()));
                    _auth.signOut();
                  },
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 30,
                          color: ProjectTheme.projectPrimaryColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16,
                              color: ProjectTheme.projectPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
