import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auths/House/uplodDetails.dart';
import 'package:flutter_auths/controllers/authentications.dart';
import 'package:flutter_auths/user_data/user_profile_data.dart';

import '../main.dart';

class ListOfHouse extends StatefulWidget {
  @override
  _ListOfHouseState createState() => _ListOfHouseState();
}

class _ListOfHouseState extends State<ListOfHouse> {
  UserData userData = new UserData();
  DocumentSnapshot documentSnapshot;
  String _email = "";
  String _username = "";

  Widget profilePicture() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              onPressed: () {}),
          CircleAvatar(
            child: ClipRRect(
              child: Image.asset('assets/images/splash_screen.png'),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green[300]),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[500],
            ),
            suffixIcon: Icon(
              Icons.filter_list,
              color: Colors.lightGreen,
            ),
            hintText: "Indore",
            focusColor: Colors.green),
      ),
    );
  }

  Widget roomList() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      color: Colors.grey[100],
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      child: GestureDetector(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/splash_screen.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Indore",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "3000 rs/month",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    )),
                    IconButton(icon: Icon(Icons.navigation), onPressed: () {})
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.only(left: 32, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "5 people",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "2 Beds",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.airline_seat_legroom_reduced,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "2 BathRooms",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.only(left: 32, right: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      Text(
                        "1234567899",
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5),
    ));
  }

  Widget _userdataWidget() {
    if (documentSnapshot != null) {
      _email = documentSnapshot.data['emailId'];
      _username = documentSnapshot.data['displayName'];
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          searchBar(),
          roomList()
        ],
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  void initState() {
    userData.getInformation().then((results) {
      setState(() {
        documentSnapshot = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        title: Text("Roomi"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: sideNav()),
      body: _userdataWidget(),
    );
  }

  Drawer sideNav() {
    return Drawer(
        child: Stack(children: <Widget>[
      //first child be the blur background
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //this is dependent on the import statment above
          child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)))),
      ListView(padding: EdgeInsets.zero, children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          currentAccountPicture: CircleAvatar(
            child: ClipRRect(
              child: Image.asset('assets/images/splash_screen.png'),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          accountName: Text(_username),
          accountEmail: Text(_email),
        ),
        ListTile(
          title: Center(
            child: Text(
              "Upload Room Details",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadRoomDetails()));
          },
        ),
        ListTile(
            title: Center(
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              signOutUser();
              FirebaseAuth.instance.onAuthStateChanged.listen((user) {
                if (user == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  print("User is not signout");
                }
              });
            })
      ])
    ]));
  }
}
