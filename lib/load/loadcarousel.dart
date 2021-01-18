import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nowmov/nowplaying/widgetnowplaying.dart';
import 'package:nowmov/style/maincss.dart';
import 'package:get/get.dart';

/////////loadcarousel
Widget mainloadcarousel() {
  return CarouselSlider(
    options: CarouselOptions(
        viewportFraction: 1.0,
        aspectRatio: 2.0,
        autoPlayAnimationDuration: Duration(milliseconds: 500),
        height: 300,
        autoPlay: true,
        enableInfiniteScroll: true),
    items: [1, 2, 3, 4, 5].map(
      (a) {
        return Builder(
          builder: (BuildContext context) {
            return loadcarousel();
          },
        );
      },
    ).toList(),
  );
}

Widget loadcarousel() {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: primary,
      // borderRadius: BorderRadius.circular(15),
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: primary,
            )),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 200,
                height: 25,
                decoration: BoxDecoration(
                    color: second, borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  for (var i = 0; i <= 3; i++)
                    Container(
                      width: 30,
                      height: 10,
                      decoration: BoxDecoration(
                          color: second,
                          borderRadius: BorderRadius.circular(100)),
                      margin: EdgeInsets.only(right: 5),
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      votestar(0, 15),
                      Container(
                        width: 20,
                        height: 10,
                        decoration: BoxDecoration(
                            color: second,
                            borderRadius: BorderRadius.circular(100)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.bar_chart,
                        color: second,
                      ),
                      Container(
                        width: 40,
                        height: 10,
                        decoration: BoxDecoration(
                            color: second,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
