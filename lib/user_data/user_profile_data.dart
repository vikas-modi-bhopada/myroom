import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  var emaiId;
  var userName;

  

  getUserProfileData(String string) {
    if (string == "username") {
      FirebaseAuth.instance.currentUser().then((value) async {
        await Firestore.instance
            .collection("users")
            .where('userid', isEqualTo: value.uid)
            .getDocuments()
            .then((QuerySnapshot querySnapshot) {
          userName = querySnapshot.documents[0].data['displayName'];
        });
      });
      return userName;
    }
    if (string == "emailid") {
      FirebaseAuth.instance.currentUser().then((value) async {
        await Firestore.instance
            .collection("users")
            .where('userid', isEqualTo: value.uid)
            .getDocuments()
            .then((QuerySnapshot querySnapshot) {
          emaiId = querySnapshot.documents[0].data['emailId'];
        });
      });
    }
    return emaiId;
  }

  getData() async {
   return await Firestore.instance
    .collection("RoomDetails")
    .getDocuments();
    /*Firestore.instance
        .collection("RoomDetails")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });*/
  }
}
