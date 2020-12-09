import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:united_palestine/model/UserModel.dart';
import 'package:united_palestine/model/WalletModel.dart';

class DatabaseService {
  final String uId;
  final String email;
  DatabaseService({this.uId, this.email});
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference wallet = FirebaseFirestore.instance.collection('wallet');

  //User
  Future UserData(
      {String email,
      String firstname,
      String lastname,
      String password,
      String bdate,
      String residence,
      String mobile,
      String profilePic,
      String passportPic,
      String gender}) async {
    return await user.doc(uId).set({
      'email': email,
      'firstName': firstname,
      'lastName': lastname,
      'bdate': bdate,
      'password': password,
      'residence': '', //residence,
      'mobile': ',', //mobile,
      'profilePic': 'profile.jpg', //profilePic,
      'passportPic': 'passport.jpg',
      'gender': '', //passportPic
    });
  }

  //get User

  List<UserModel> getuser(QuerySnapshot qs) {
    return qs.docs.map((ds) {
      return UserModel(
          bdate: ds.data()['bdate'],
          password: ds.data()['password'],
          email: ds.data()['email'],
          firstName: ds.data()['firstName'],
          lastName: ds.data()['lastName'],
          mobile: ds.data()['mobile'],
          passportPic: ds.data()['passportPic'],
          profilePic: ds.data()['profilePic'],
          residence: ds.data()['residence'],
          gender: ds.data()['gender']);
    }).toList();
  }

  Stream<List<UserModel>> get userStream {
    return user.snapshots().map(getuser);
  }

  Future WalletData(
      {String totalBalance,
        String transaction1,
        String balance1,
        String date1,
        String transaction2,
        String balance2,
        String date2,
        String transaction3,
        String balance3,
        String date3
        }) async {
    return await wallet.doc().set({
      'totalBalance': totalBalance,
      'transaction1': transaction1,
      'balance1': balance1,
      'date1': date1,
      'transaction2': transaction2,
      'balance2': balance2,
      'date2': date2,
      'transaction3': transaction3,
      'balance3': balance3,
      'date13': date3

    });
  }

  List<WalletModel> getWallet(QuerySnapshot qs) {
    return qs.docs.map((ds) {
      return WalletModel(
          totalBalance: ds.data()['totalBalance'],
        transaction1: ds.data()['transaction1'],
        balance1: ds.data()['balance1'],
        date1: ds.data()['date1'],
        transaction2: ds.data()['transaction2'],
        balance2: ds.data()['balance2'],
        date2: ds.data()['date2'],
        transaction3: ds.data()['transaction3'],
        balance3: ds.data()['balance3'],
        date3: ds.data()['date3'],
          );
    }).toList();
  }
  Stream<List<WalletModel>> get walletStream {
    return wallet.snapshots().map(getWallet);
  }

}
