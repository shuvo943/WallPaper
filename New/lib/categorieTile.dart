import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categoriePage.dart';

// ignore: camel_case_types
class categorieTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  categorieTile({@required this.imgUrl, @required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => categoriePage(
                      categorieName: title.toLowerCase(),
                    )));
      },
      child: Container(
        height: 50,
        width: 100,
        margin: EdgeInsets.only(right: 6),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black26,
              ),
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
