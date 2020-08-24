import 'dart:convert';

import 'package:New/wallpaperModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:New/data.dart';
import 'package:New/widget.dart';

class categoriePage extends StatefulWidget {
  final String categorieName;
  categoriePage({this.categorieName});
  @override
  _categoriePageState createState() => _categoriePageState();
}

class _categoriePageState extends State<categoriePage> {
  List<WallpaperModel> wallpapers = new List();
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
    getsearchWallpapers(widget.categorieName);

    super.initState();
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
        child: wallPaperList(wallpapers: wallpapers, context: context),
      ),
    );
  }
}
