import 'package:flutter/material.dart';
import 'package:flutter_auths/House/uplodDetails.dart';
import 'package:flutter_auths/controllers/authentications.dart';

import '../main.dart';

class ListOfHouse extends StatefulWidget {
  @override
  _ListOfHouseState createState() => _ListOfHouseState();
}

class _ListOfHouseState extends State<ListOfHouse> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Vikas Modi"),
              accountEmail: Text("vikas977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(
                  child: Image.asset('assets/images/splash_screen.png'),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
            ListTile(
              title: Text("Upload Room Details"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadRoomDetails()));
              },
            ),
            ListTile(
              title: Text("Log Out"),
              onTap: () => signOutUser().then((value) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false);
              }),
            )
          ],
        ),
      ),
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
}
