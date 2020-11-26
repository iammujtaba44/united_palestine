import 'package:flutter/material.dart';
import 'package:united_palestine/project_theme.dart';

class WalletScreen extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text(
                  'Balance:',
                  style: TextStyle(fontSize: 22, color: Colors.red[900]),
                ),
                trailing: Text(
                  '1000 USD',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildButton('Deposit'),
                BuildButton('Withdraw'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildButton('Request Money'),
                BuildButton('Send Money'),
              ],
            ),
            SizedBox(height: 50),
            Text(
              'Transaction History',
              style: TextStyle(fontSize: 24, color: Colors.red[900],fontWeight: FontWeight.w400),
            ),
            BuildCard('01/08/2020','Deposit','2000 USD'),
            BuildCard('03/08/2020', 'Sent - Donation to U.P. Gov ', '500 USD'),
            BuildCard('05/08/2020','Sent - Donation to U.P. Gov','500 USD'),
            Align(alignment: Alignment.topRight,child: InkWell(onTap: (){},child: Text('View All',style: TextStyle(fontSize: 19,)),))

          ],
        ),
      ),
    );
  }
}

Widget BuildButton(String title) {
  return SizedBox(
    width: 140,
    height: 40,
    child: FlatButton(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),
      ),
      color: Colors.red[900],
      onPressed: () {},
      padding: const EdgeInsets.all(10),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10)),
    ),
  );
}
Widget BuildCard(String date, String transaction, String amount){
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 100,
    width: double.infinity,
    child: Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red[900],
              ),
            ),
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(transaction,style: TextStyle(color: Colors.red[900],fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Text(amount,style: TextStyle(fontSize: 16),),
              ),
            ],)
          ],
        ),
      ),
    ),
  );
}
