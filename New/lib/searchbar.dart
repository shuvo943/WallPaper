import 'package:New/aftersearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
Widget searchBar() {
  return Container(
    height: 32,
    width: double.maxFinite,
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.amber,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              // labelText: "aaa",
              hintText: 'Search Your Wallpaper',
              hintStyle: TextStyle(color: Colors.black, fontSize: 15),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 15.5, left: 15),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            BuildContext context;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => aftersearch()));
          },
          child: Container(
            //   child: Padding(
            // padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              size: 20.0,
            ),
          ),
        ),
      ],
    ),
  );
}
