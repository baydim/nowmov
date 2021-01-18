import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowmov/load/loadcarousel.dart';
import 'package:nowmov/load/loadposter.dart';
import 'package:nowmov/manage/manage.dart';
import 'package:nowmov/nowplaying/widgetnowplaying.dart';
import 'package:nowmov/style/maincss.dart';

class MainNowPlaying extends StatefulWidget {
  @override
  _MainNowPlayingState createState() => _MainNowPlayingState();
}

class _MainNowPlayingState extends State<MainNowPlaying> {
  Manage manage = Get.put(Manage());

  @override
  void initState() {
    super.initState();
    manage.getNowPlaying();
    manage.getPoppular();
  }

  void dispose() {
    manage.getNowPlaying();
    manage.getPoppular();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Manage>(
      init: Manage(),
      builder: (val) {
        return Scaffold(
          backgroundColor: second,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 90,
                actions: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primary,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: primary, blurRadius: 10)],
                      ),
                      child: Icon(Icons.search),
                    ),
                  )
                ],
                expandedHeight: 275,
                flexibleSpace: FlexibleSpaceBar(
                  background: val.modelNowPlaying1 == null
                      ? mainloadcarousel()
                      : CarouselSlider(
                          options: CarouselOptions(
                              viewportFraction: 1.0,
                              aspectRatio: 2.0,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 500),
                              height: 300,
                              autoPlay: true,
                              enableInfiniteScroll: true),
                          items: val.modelNowPlaying1.results.map(
                            (a) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return carousel(a.id, a.backdropPath, a.title,
                                      a.voteAverage, a.popularity, a.genreIds);
                                },
                              );
                            },
                          ).toList(),
                        ),
                ),
              ),

              //////////////////////////////
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              ////////////////////
              for (var i = 0; i < 5; i++)
                SliverToBoxAdapter(
                  child: val.modelPoppular1 == null
                      ? mainloadposter()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            tema("Poppular"),
                            SizedBox(
                              height: 5,
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 15),
                                  for (var a in val.modelPoppular1.results)
                                    terpos(a.id, a.posterPath, a.title,
                                        a.voteAverage, a.releaseDate),
                                  SizedBox(width: 5),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                ),
            ],
          ),
        );
      },
    );
  }
}
