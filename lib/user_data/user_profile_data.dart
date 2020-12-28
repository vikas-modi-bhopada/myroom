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
      await Firestore.instance
          .collection("users")
          .where('userid', isEqualTo: value.uid)
          .getDocuments()
          .then((QuerySnapshot querySnapshot) {
        x = querySnapshot.documents[0].data['displayName'];
      });
    });
    return x;
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
