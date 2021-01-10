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
  QuerySnapshot querySnapshot;
  QuerySnapshot querySnapshot1;

  var _email;
  var _username;
  var searchbarData;

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
            suffixIcon: IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                UserData().getData(searchbarData).then((QuerySnapshot results) {
                  setState(() {
                    querySnapshot = results;
                  });
                });
              },
            ),
            /*Icon(
              Icons.filter_list,
              color: Colors.lightGreen,
            ),*/
            hintText: "Indore",
            focusColor: Colors.green),
        onChanged: (value) {
          searchbarData = value;
        },
      ),
    );
  }

  Widget roomList() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      color: Colors.grey[100],
      child: listViewForRoomList(),
    ));
  }

  ListView listViewForRoomList() {
    if (querySnapshot != null) {
      print(querySnapshot.documents.length);
      return ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                firstRowOfListView(index),
                SizedBox(
                  height: 12,
                ),
                secondRowOfListView(index),
                SizedBox(
                  height: 16,
                ),
                thirdRowOfListView(index)
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: querySnapshot.documents.length);
    } else {
      print("query snapshot is null");
      return null;
    }
  }

  Container thirdRowOfListView(int index) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 16),
      child: Row(
        children: [
          Icon(
            Icons.phone,
            size: 12,
            color: Colors.grey[600],
          ),
          Text(
            querySnapshot.documents[index].data['Mobile'],
            style: TextStyle(color: Colors.grey[600]),
          )
        ],
      ),
    );
  }

  Container secondRowOfListView(int index) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          rowWidgetForNoOfPeople(index),
          rowWidgetForNoOfBeds(index),
          rowWidgetForNoOfBathRooms(index)
        ],
      ),
    );
  }

  Row rowWidgetForNoOfBathRooms(int index) {
    return Row(
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
          querySnapshot.documents[index].data['BathRooms'],
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }

  Row rowWidgetForNoOfBeds(int index) {
    return Row(
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
          querySnapshot.documents[index].data['Beds'],
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }

  Row rowWidgetForNoOfPeople(int index) {
    return Row(
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
          querySnapshot.documents[index].data['Members'],
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }

  Row firstRowOfListView(int index) {
    return Row(
      children: [
        containerOfImageOfRoomInListView(),
        SizedBox(
          width: 20,
        ),
        widgetForLocationAndPrice(index),
        IconButton(icon: Icon(Icons.navigation), onPressed: () {})
      ],
    );
  }

  Container containerOfImageOfRoomInListView() {
    return Container(
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
    );
  }

  Expanded widgetForLocationAndPrice(int index) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidgetForLocation(index),
        SizedBox(
          height: 8,
        ),
        textWidgetForPriceOfRoom(index)
      ],
    ));
  }

  Text textWidgetForPriceOfRoom(int index) {
    return Text(
      querySnapshot.documents[index].data['Price'],
      style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Text textWidgetForLocation(int index) {
    return Text(
      querySnapshot.documents[index].data['Location'],
      style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
    );
  }

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((value) {
      _email = value.email;
      _username = value.displayName;
    });
    UserData().getData(searchbarData).then((QuerySnapshot results) {
      setState(() {
        querySnapshot = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForBuildWidget(),
      drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: sideNav()),
      // body: _userdataWidget(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          searchBar(),
          roomList()
        ],
      ),
    );
  }

  AppBar buildAppBarForBuildWidget() {
    return AppBar(
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
    );
  }

  Drawer sideNav() {
    return Drawer(
        child: Stack(children: <Widget>[
      //first child be the blur background
      backdropFilterWidgetForDrawer(),
      listViewOfDrawer()
    ]));
  }

  ListView listViewOfDrawer() {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      userAccountsDrawerHeader(),
      uploadRoomDetailsListTileForDrawer(),
      logOutListTileForDrawer()
    ]);
  }

  ListTile logOutListTileForDrawer() {
    return ListTile(
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              print("User is not signout");
            }
          });
        });
  }

  ListTile uploadRoomDetailsListTileForDrawer() {
    return ListTile(
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
    );
  }

  UserAccountsDrawerHeader userAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      currentAccountPicture: CircleAvatar(
        child: ClipRRect(
          child: Image.asset('assets/images/splash_screen.png'),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      accountName: Text('$_username'),

      //Text('$_username'),
      accountEmail: Text('$_email'),
    );
  }

  BackdropFilter backdropFilterWidgetForDrawer() {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        //this is dependent on the import statment above
        child: Container(
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5))));
  }
}
