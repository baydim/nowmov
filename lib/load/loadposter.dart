import 'package:flutter/material.dart';
import 'package:nowmov/nowplaying/widgetnowplaying.dart';
import 'package:nowmov/style/maincss.dart';

Widget mainloadposter() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15),
        width: 90,
        height: 15,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(width: 15),
            for (var i = 0; i <= 6; i++) loadposter(),
            SizedBox(width: 5),
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}

Widget loadposter() {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 150,
    height: 225,
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(15),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [primary.withOpacity(0.95), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 15,
                  decoration: BoxDecoration(
                      color: second, borderRadius: BorderRadius.circular(100)),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    votestar(0, 15),
                    Container(
                      width: 20,
                      height: 10,
                      decoration: BoxDecoration(
                          color: second,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 10,
                  decoration: BoxDecoration(
                      color: second, borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
