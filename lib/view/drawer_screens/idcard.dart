import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:united_palestine/project_theme.dart';

class IdCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _height * 0.08,
        title: Text('ID Card'),
        backgroundColor: ProjectTheme.projectPrimaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Id_card_front(height: _height),
            SizedBox(height:25 ,),
            Id_card_back(height: _height),
            SizedBox(height:40 ,),
            RoundedButton('Share',_width),
            RoundedButton('Print',_width),
            RoundedButton('Order by Email',_width)
          ],
        ),
      ),
    );
  }
}


class Id_card_front extends StatelessWidget {
  const Id_card_front({
    Key key,
    @required double height,
  }) : _height = height;

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height / 3.8,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background/background.jpeg"),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 5),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 0, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'UNITED',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'PALESTINE',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.red[900]),
                    ),
                  ],
                ),
                Text(
                  'Identification card',
                  style: TextStyle(fontSize: 11),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/id/1.png"),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      height: 120,
                      width: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BuildRow('Name:', 'Tamer Atia'),
                          SizedBox(
                            height: 7,
                          ),
                          BuildRow('United Palestine ID:', 'UP273546287'),
                          SizedBox(
                            height: 7,
                          ),
                          BuildRow('Date of birth:', '07/09/1980'),
                          SizedBox(
                            height: 7,
                          ),
                          BuildRow('Residence:', 'Amman'),
                          SizedBox(
                            height: 7,
                          ),
                          BuildRow('Issue date:', '06/09/2020'),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage("assets/logo.png"),
                  height: 70,
                ),
                Image(
                  image: AssetImage("assets/id/bar.png"),
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget BuildRow(String name, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 11),
        ),
        Text(
          detail,
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
class Id_card_back extends StatelessWidget {
  const Id_card_back({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height / 3.8,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.jpeg"),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 5),
              )
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 13),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage("assets/id/2.png"),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    height: 60,
                    width: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildRow('Citizenship Status:', 'Under Review'),
                        SizedBox(
                          height: 7,
                        ),
                        BuildRow('Issue date:', '06/09/2020'),
                      ],
                    ),
                  )
                ],
              ),
              Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage("assets/logo.png"),
                      height: 70,
                    )),
              )
            ],
          ),
        ));
  }

  Widget BuildRow(String name, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 11),
        ),
        Text(
          detail,
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
class RoundedButton extends StatelessWidget {
  String buttonName;
  double width;
  RoundedButton(this.buttonName,this.width);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width/1.2,
      child: FlatButton(
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        color: Colors.red[900],
        onPressed: () {},
        padding: const EdgeInsets.all(10),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50)),
      ),
    );
  }
}
