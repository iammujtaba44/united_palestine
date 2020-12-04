import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:united_palestine/model/UserModel.dart';

class DatabaseService {
  final String uId;
  final String email;
  DatabaseService({this.uId, this.email});
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');

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
      String passportPic}) async {
    return await user.doc(uId).set({
      'email': email,
      'firstName': firstname,
      'lastName': lastname,
      'bdate': bdate,
      'password': password,
      'residence': '', //residence,
      'mobile': ',', //mobile,
      'profilePic': '', //profilePic,
      'passportPic': '' //passportPic
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
          residence: ds.data()['residence']);
    }).toList();
  }

  Stream<List<UserModel>> get userStream {
    return user.snapshots().map(getuser);
  }
}
