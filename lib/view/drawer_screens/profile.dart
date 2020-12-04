import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:united_palestine/model/UserModel.dart';
import 'package:united_palestine/project_theme.dart';
import 'package:united_palestine/services/Constants.dart';
import 'package:united_palestine/services/database.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpanded = false;
  final CollectionReference userdata =
      FirebaseFirestore.instance.collection('user');

  DatabaseService database = DatabaseService(uId: Constants.userId);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: _height * 0.08,
          title: Text('Profile'),
          backgroundColor: ProjectTheme.projectPrimaryColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: StreamBuilder(
                  stream: database
                      .userStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return getPopulaorContainer(user: snapshot.data[0]);
                  },
                ),
              ),
              Column(
                children: List.generate(
                    titles.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(
                                  left: 20, top: 15.0, right: 20)
                              : const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
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
                                          color:
                                              ProjectTheme.projectPrimaryColor,
                                        )
                                      : Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color:
                                              ProjectTheme.projectPrimaryColor,
                                        ),
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      if (isExpanded)
                                        isExpanded = false;
                                      else
                                        isExpanded = true;
                                    });
                                  },
                                  childrenPadding:
                                      EdgeInsets.only(top: 10, bottom: 10),
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
                                        BuildCards(
                                            'Date of Birth:', '07/09/1980'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        BuildCards('Gender:', 'Male'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        BuildCards('City of Residence:',
                                            'Amman, Jordon'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        BuildCards('Mobile Number:',
                                            '+962 79 5822348'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        BuildCards('Profile Picture:',
                                            'Profilepic.jpg'),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        BuildCards(
                                            'Passport Pictue:', 'Upload'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        )),
              )
            ],
          ),
        )
        // child: ListView.builder(
        //     itemCount: titles.length,
        //     itemBuilder: (context, index) => Column(
        //           children: [
        //             Container(
        //               decoration:
        //                   BoxDecoration(color: Colors.white, boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.grey.withOpacity(0.2),
        //                   spreadRadius: 1,
        //                   blurRadius: 1,
        //                   offset: Offset(1, 3),
        //                 )
        //               ]),
        //               child: ExpansionTile(
        //                 trailing: isExpanded
        //                     ? Icon(
        //                         Icons.keyboard_arrow_down,
        //                         color: ProjectTheme.projectPrimaryColor,
        //                       )
        //                     : Icon(
        //                         Icons.keyboard_arrow_right_outlined,
        //                         color: ProjectTheme.projectPrimaryColor,
        //                       ),
        //                 onExpansionChanged: (value) {
        //                   setState(() {
        //                     if (isExpanded)
        //                       isExpanded = false;
        //                     else
        //                       isExpanded = true;
        //                   });
        //                 },
        //                 childrenPadding: EdgeInsets.only(top: 10, bottom: 10),
        //                 title: Text(
        //                   titles[index],
        //                   style: TextStyle(
        //                       color: ProjectTheme.projectPrimaryColor,
        //                       fontSize: 18.5),
        //                 ),
        //                 children: [
        //                   Column(
        //                     children: [
        //                       BuildCards('Name:', 'Tamer'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('Last Name:', 'Atia'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('Date of Birth:', '07/09/1980'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('Gender:', 'Male'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('City of Residence:', 'Amman, Jordon'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('Mobile Number:', '+962 79 5822348'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('Profile Picture:', 'Profilepic.jpg'),
        //                       SizedBox(
        //                         height: 10.0,
        //                       ),
        //                       BuildCards('Passport Pictue:', 'Upload'),
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),
        //             SizedBox(
        //               height: 10.0,
        //             )
        //           ],
        //         )),
        );
  }

  Widget getPopulaorContainer({UserModel user}) {

    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _bdate = TextEditingController();
    final TextEditingController _residence = TextEditingController();
    final TextEditingController _mobile = TextEditingController();
    final TextEditingController _profilePic = TextEditingController();
    final TextEditingController _passportPic = TextEditingController();
    final TextEditingController _gender = TextEditingController();


    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
          'Basic Information',
          style: TextStyle(
              color: ProjectTheme.projectPrimaryColor, fontSize: 18.5),
        ),
        children: [
          Column(
            children: [
              BuildBasicInfoData(user, 'firstName', 'First Name:', _firstName, user.firstName),
              BuildBasicInfoData(user, 'lastName', 'Last Name:', _lastName, user.lastName),
              BuildBasicInfoData(user, 'bdate', 'Date of Birth:', _bdate, user.bdate),
              BuildBasicInfoData(user, 'gender', 'Gender', _gender, user.gender),
              BuildBasicInfoData(user, 'residence', 'City of Residence', _residence, user.residence),
              BuildBasicInfoData(user, 'mobile', 'Mobile Number:', _mobile, user.mobile),
              BuildBasicInfoData(user, 'profilePic', 'Profile Picture:', _profilePic, user.profilePic),
              BuildBasicInfoData(user, 'passportPic', 'Passport Picture:', _passportPic, user.passportPic),
            ],
          )
        ],
      ),
    );
  }

  Widget BuildBasicInfoData(UserModel user, String fieldName,String fieldTitle, TextEditingController dater,var userModel){
    return Column(
      children: [
        InkWell(
            onTap: () {
              return Alert(
                  context: context,
                  title: "UPDATE",
                  content: Column(
                    children: <Widget>[
                      TextField(
                        controller: dater,
                      ),
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      onPressed: () async {
                        userdata
                            .doc(Constants.userId)
                            .update({fieldName: dater.text.trim()});

                        Navigator.pop(context);
                      },
                      child: Text(
                        "Update",
                        style:
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ]).show();
            },
            child: BuildCards(fieldTitle, userModel)),
        SizedBox(
          height: 10.0,
        ),
      ],
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
    'Contact details',
    'Education and work',
    'Skills & Expertise ',
    'U.P. Citizenship',
    'Personal documents',
    'Circle Extra Information',
  ];
}
