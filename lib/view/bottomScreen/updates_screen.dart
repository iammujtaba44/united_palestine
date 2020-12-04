import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:united_palestine/project_theme.dart';
import 'package:united_palestine/view/signin/signin.dart';

class Updatescreen extends StatefulWidget {
  @override
  _UpdatescreenState createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> {
  int _currentIndex = 0;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawer: buildCustomDrawer(_height, _width, context),
      // appBar: AppBar(
      //   toolbarHeight: _height * 0.08,
      //   title: Center(child: Text('UPDATES')),
      //   backgroundColor: ProjectTheme.projectPrimaryColor,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.notifications),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        child: Container(
          color: ProjectTheme.projectBackgroundColor,
          height: _height,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage("assets/updates/1.jpeg"),
                  fit: BoxFit.fill,
                )),
                height: _height * 0.16,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: ListTile(
                    title: Text("What is ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ProjectTheme.projectPrimaryColor,
                        ),
                        onPressed: () {}),
                    subtitle: Text(
                      "United Palestine",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: _height * 0.01),
              Container(
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage("assets/updates/2.jpeg"),
                  fit: BoxFit.fill,
                )),
                height: _height * 0.16,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: ListTile(
                    title: Text("Claim your united ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ProjectTheme.projectPrimaryColor,
                        ),
                        onPressed: () {}),
                    subtitle: Text(
                      "Palestine citizenship",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: _height * 0.01),
              Container(
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage("assets/updates/3.jpeg"),
                  fit: BoxFit.fill,
                )),
                height: _height * 0.16,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: ListTile(
                    title: Text("Explore United ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ProjectTheme.projectPrimaryColor,
                        ),
                        onPressed: () {}),
                    subtitle: Text(
                      "Palestine citizenship",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: _height * 0.01),
              Container(
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage("assets/updates/4.jpeg"),
                  fit: BoxFit.fill,
                )),
                height: _height * 0.16,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: ListTile(
                    title: Text("Progress and",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ProjectTheme.projectPrimaryColor,
                        ),
                        onPressed: () {}),
                    subtitle: Text(
                      "Milestone",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: _height * 0.01),
              Container(
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage("assets/updates/5.jpeg"),
                  fit: BoxFit.fill,
                )),
                height: _height * 0.16,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: ListTile(
                    title: Text("Events happening",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: ProjectTheme.projectPrimaryColor,
                        ),
                        onPressed: () {}),
                    subtitle: Text(
                      "near you ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //bottom Navigation Bar
    );
  }
}
