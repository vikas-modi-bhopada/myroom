import 'dart:io';
import 'package:flutter_auths/Widget/bezierContainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UploadRoomDetails extends StatefulWidget {
  @override
  _UploadRoomDetailsState createState() => _UploadRoomDetailsState();
}

class _UploadRoomDetailsState extends State<UploadRoomDetails> {
  File _image;
  Future getImage() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  File _image1;
  Future getImage1() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image1 = image;
    });
  }

  Widget _locationlabel(String data) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.grey, filled: true),
          )
        ],
      ),
    );
  }

  Widget _pricelabel(String data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.grey, filled: true),
          )
        ],
      ),
    );
  }

  Widget _memberslabel(String data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.grey, filled: true),
          )
        ],
      ),
    );
  }

  Widget _bedslabel(String data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.grey, filled: true),
          )
        ],
      ),
    );
  }

  Widget _bathroomslabel(String data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.grey, filled: true),
          )
        ],
      ),
    );
  }

  Widget _residence() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _memberslabel("Members")),
          SizedBox(
            width: 50,
          ),
          Expanded(child: _bedslabel("Beds")),
          SizedBox(
            width: 50,
          ),
          Expanded(child: _bathroomslabel("Bathrooms")),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'R',
          style: GoogleFonts.portLligatSans(
              // ignore: deprecated_member_use
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'oo',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'mi',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _phonenumber(String data) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, fillColor: Colors.grey, filled: true),
          )
        ],
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)));
  }

  Widget _uploadRoomImage() {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  padding: EdgeInsets.all(8),
                  decoration: myBoxDecoration(),
                  child: _image == null
                      ? Icon(Icons.upload_file, size: 50, color: Colors.blueGrey)
                      : Image.file(_image),
                ),
              )),
          Expanded(
            child: GestureDetector(
              onTap: () {
                getImage1();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                padding: EdgeInsets.all(8),
                decoration: myBoxDecoration(),
                child: _image == null
                    ? Icon(Icons.upload_file, size: 50, color: Colors.blueGrey)
                    : Image.file(_image1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _saveDetailsButton() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Save',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: height,
          child: Stack(
            children: [
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5),
                        _title(),
                        SizedBox(
                          height: 5,
                        ),
                        _locationlabel("Location"),
                        SizedBox(
                          height: 15,
                        ),
                        _pricelabel("Price"),
                        SizedBox(
                          height: 15,
                        ),
                        _residence(),
                        SizedBox(
                          height: 15,
                        ),
                        _phonenumber("Phone Number"),
                        SizedBox(
                          height: 15,
                        ),
                        _uploadRoomImage(),
                        SizedBox(
                          height: 15,
                        ),
                        _saveDetailsButton()
                      ],
                    )),
              )
            ],
          )),
    );
  }
}