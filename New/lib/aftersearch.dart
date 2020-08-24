import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:New/widget.dart';
import 'package:flutter/material.dart';
import 'package:New/wallpaperModel.dart';
import 'package:http/http.dart' as http;
import 'package:New/data.dart';

class aftersearch extends StatefulWidget {
  final String searchquery;
  aftersearch({this.searchquery});
  @override
  _aftersearchState createState() => _aftersearchState();
}

class _aftersearchState extends State<aftersearch> {
  List<WallpaperModel> wallpapers = new List();
  TextEditingController textCopier = TextEditingController();
  getsearchWallpapers(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&page=1&per_page=30",
        headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaper = WallpaperModel();
      wallpaper = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaper);
    });

    setState(() {});
  }

  @override
  void initState() {
    getsearchWallpapers(widget.searchquery);

    super.initState();

    textCopier.text = widget.searchquery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: titlettext(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
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
                        controller: textCopier,
                        decoration: InputDecoration(
                          // labelText: "aaa",
                          hintText: 'Search Your Wallpaper',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 15.5, left: 15),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getsearchWallpapers(textCopier.text);
                        setState(() {
                          wallPaperList(
                              wallpapers: wallpapers, context: context);
                        });
                      },
                      child: Container(
                        //   child: Padding(
                        // padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.search,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              wallPaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
