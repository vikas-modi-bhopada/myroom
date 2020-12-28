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
          .where('userid', isEqualTo: value.uid)
          .getDocuments()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.documents.forEach((result) {
           x= result.data["displayName"].toString();
          //print('${result.data["displayName"]}}');
        });
        return x;
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
