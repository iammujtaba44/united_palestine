import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:united_palestine/project_theme.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: ProjectTheme.projectPrimaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 3),
                        )
                      ]),
                      child: ExpansionTile(
                        trailing: isExpanded
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                color: ProjectTheme.projectPrimaryColor,
                              )
                            : Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: ProjectTheme.projectPrimaryColor,
                              ),
                        onExpansionChanged: (value) {
                          setState(() {
                            if (isExpanded)
                              isExpanded = false;
                            else
                              isExpanded = true;
                          });
                        },
                        childrenPadding: EdgeInsets.only(top: 10, bottom: 10),
                        title: Text(
                          titles[index],
                          style: TextStyle(
                              color: ProjectTheme.projectPrimaryColor,
                              fontSize: 18.5),
                        ),
                        children: [
                          Column(
                            children: [
                              BuildCards('Name:', 'Tamer'),
                              SizedBox(
                                height: 10.0,
                              ),
                              BuildCards('Last Name:', 'Atia'),
                              SizedBox(
                                height: 10.0,
                              ),
                              BuildCards('Date of Birth:', '07/09/1980'),
                              SizedBox(
                                height: 10.0,
                              ),
                              BuildCards('Gender:', 'Male'),
                              SizedBox(
                                height: 10.0,
                              ),
                              BuildCards('City of Residence:', 'Amman, Jordon'),
                              SizedBox(
                                height: 10.0,
                              ),
                              BuildCards('Mobile Number:', '+962 79 5822348'),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                )),
      ),
    );
  }

  Widget BuildCards(String title, String description) {
    return Container(
      height: 55,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(1, 3),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w400),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  final titles = [
    'Basic Information',
    'Contact details',
    'Education and work',
    'Skills & Expertise ',
    'U.P. Citizenship',
    'Personal documents',
    'Circle Extra Information',
  ];
}
