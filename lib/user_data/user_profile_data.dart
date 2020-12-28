import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  getInformation() async {
    FirebaseAuth.instance.currentUser().then((value) async {
      return await Firestore.instance
          .collection('users')
          .document(value.uid)
          .get();
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
