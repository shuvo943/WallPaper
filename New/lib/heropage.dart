import 'package:flutter/material.dart';

class heroPage extends StatefulWidget {
  final String Img;
  heroPage({this.Img});

  @override
  _heroPageState createState() => _heroPageState();
}

class _heroPageState extends State<heroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      tag: widget.Img,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              widget.Img,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 30),
                height: MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Set As Wallpaper",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "It will be saved in Your Gallery",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25, left: 15),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
