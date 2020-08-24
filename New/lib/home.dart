import 'dart:convert';

import 'package:New/categorieTile.dart';
import 'package:New/aftersearch.dart';

import 'package:New/wallpaperModel.dart';
import 'package:http/http.dart' as http;
import 'package:New/widget.dart';
import 'package:flutter/material.dart';
import 'package:New/data.dart';
import 'package:New/catdatablueprint.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<categoriemodel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController textCopier = TextEditingController();

  getTrendingWallpapers() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=30&page=1",
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
    getTrendingWallpapers();
    categories = getcategorie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => aftersearch(
                                      searchquery: textCopier.text,
                                    )));
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
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                child: Text(
                  "Is Being Developed By Shavvy",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return categorieTile(
                      imgUrl: categories[index].imgUrl,
                      title: categories[index].categorieName,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              wallPaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
