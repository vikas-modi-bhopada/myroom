import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  var x;

  getInformation() async {
    FirebaseAuth.instance.currentUser().then((value) async {
      return await Firestore.instance
          .collection('users')
          .document(value.uid)
          .get();
    });
  }

  onPressed() {
    FirebaseAuth.instance.currentUser().then((value) async {
      return await Firestore.instance
          .collection("users")
          .getDocuments()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.documents.forEach((result) {
          print('${result.data["displayName"]}}');
        });
      });
    });
  }

  getData() {
    Firestore.instance
        .collection("RoomDetails")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }
}
