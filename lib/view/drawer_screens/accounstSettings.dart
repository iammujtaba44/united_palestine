import 'package:flutter/material.dart';
import 'package:united_palestine/project_theme.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Setting'),
        backgroundColor: ProjectTheme.projectPrimaryColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            titles[index],
                            style: TextStyle(color: Colors.red[900]),
                          ),
                          trailing: Text(trailing[index]),
                        ),
                        Container(
                          width: _width / 1.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 0.1),
                          ),
                        ),
                      ],
                    )),
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
              onPressed: () {},
              padding: const EdgeInsets.all(10),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50)),
            ),
            ),
          ),
        ],
      ),
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
