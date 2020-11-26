import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:united_palestine/project_theme.dart';

class ProfileScreen extends StatelessWidget {
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
          itemBuilder: (context, index) => Card(
              elevation: 2,
              child: ExpansionTile(childrenPadding: EdgeInsets.only(top: 10,bottom: 10),
                title: Text(titles[index]),
                children: [
                  Column(
                    children: [
                      BuildCards('Name:','Tamer'),
                      BuildCards('Last Name:','Atia'),
                      BuildCards('Date of Birth:','07/09/1980'),
                      BuildCards('Gender:','Male'),
                      BuildCards('City of Residence:','Amman, Jordon'),
                      BuildCards('Mobile Number:','+962 79 5822348'),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
  Widget BuildCards (String title, String description){
    return Container(height: 55,
      child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(left:0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(
              title,textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12),
            ),
                Text(
              description,
              style: TextStyle(fontSize: 12),
            ),],
            ),
          )),
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
