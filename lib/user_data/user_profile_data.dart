import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String _email ,_username;
  

  addInformation(String email,String username){

    _email = email;
    _username = username;

    Firestore.instance.collection("user").add({
      'email_id': _email,
      'username': _username
    }).then((value) => print('User information added'))
    .catchError((e) => print('Failed to add user information'));
  }

  getInformation() async{
    return await Firestore.instance.collection('user').getDocuments();
  }
}