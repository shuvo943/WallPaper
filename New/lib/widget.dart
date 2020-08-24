import 'package:New/heropage.dart';
import 'package:New/wallpaperModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titlettext() {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Wallpaper',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
          ),
          Text(
            'Hub',
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w800),
          )
        ],
      ),
    ),
  );
}

Widget wallPaperList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12.0),
    child: GridView.count(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map((e) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => heroPage(
                              Img: e.src.portrait,
                            )));
              },
              child: Hero(
                tag: e.src.portrait,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      e.src.portrait,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList()),
  );
}
