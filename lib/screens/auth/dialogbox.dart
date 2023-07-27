import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;

  const CustomDialogBox(
      {Key? key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        elevation: 2,
        // margin: EdgeInsets.all(19),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('User Login Form',
                      style: TextStyle(fontSize: 21))),
              Divider(),

              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * (0.8),
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(

                    onChanged: (value) {

                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User password',
                    ),
                  )
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),),
                  // Divider(),

                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Click Here To Login'),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),),
                  //  Divider(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.black),padding: EdgeInsets.fromLTRB(100,18,100,18)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Container()
                      ),);
                    },
                    child: Text("New User click here",
                    ),
                  ),

                ],
              ),
              Visibility(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator()
                  )
              ),
            ],
          ),
        )
    );
  }
}
