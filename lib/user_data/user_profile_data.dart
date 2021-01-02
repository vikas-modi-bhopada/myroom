import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {

  getData(dynamic searchbarData) async {
   return await Firestore.instance
    .collection("RoomDetails")
    .where('Location',isEqualTo: searchbarData)
    .getDocuments();
    
  }
}
