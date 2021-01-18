import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nowmov/detail/detail.dart';
import 'package:nowmov/model/config.dart';
import 'package:nowmov/style/maincss.dart';

Widget tema(String tema) {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Text(
      tema,
      style: TextStyle(color: Colors.white, fontFamily: 'sm'),
    ),
  );
}

//////posterlist
Widget poster(String url) {
  return Image.network(
    url,
    fit: BoxFit.cover,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        ),
      );
    },
  );
}

/////////////////////////////////////////
Widget terpos(int id, String url, String judul, double voteaverage,
    DateTime releasedate) {
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
      child: InkWell(
        onTap: () => Get.to(Detail(id)),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: poster(gambar2 + url),
            ),
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
                  Text(
                    judul,
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      votestar(voteaverage, 15),
                      Text(
                        voteaverage.toString(),
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    f.format(
                      releasedate,
                    ),
                    style: TextStyle(
                        fontSize: 12, color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget votestar(double vote, double size) {
  return RatingBarIndicator(
    rating: vote / 2,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: size,
    unratedColor: Colors.grey,
  );
}

//////votestar
Widget votestari(double vote, double size) {
  return RatingBar.builder(
    initialRating: vote / 2,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    unratedColor: Colors.grey,
    itemSize: size,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (value) {},
  );
}

//////////////////////////////carousel

////textgenre
Widget gnr(String gen) => Padding(
      padding: EdgeInsets.only(right: 5),
      child: Text(
        gen,
        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
      ),
    );
Widget carousel(int id, String backdrop, String title, double voteaverage,
    double populary, List<int> genre) {
  return InkWell(
    onTap: () => Get.to(Detail(id)),
    child: Container(
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
              child: poster(gambar1 + backdrop)),
          Positioned(
            top: 20,
            bottom: -1,
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
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'sm', fontSize: 24),
                ),
                Row(
                  children: <Widget>[
                    for (var a in genre)
                      Row(
                        children: <Widget>[
                          if (a == 28) gnr(hm[0]),
                          if (a == 12) gnr(hm[1]),
                          if (a == 16) gnr(hm[2]),
                          if (a == 35) gnr(hm[3]),
                          if (a == 80) gnr(hm[4]),
                          if (a == 99) gnr(hm[5]),
                          if (a == 18) gnr(hm[6]),
                          if (a == 10751) gnr(hm[7]),
                          if (a == 14) gnr(hm[8]),
                          if (a == 36) gnr(hm[9]),
                          if (a == 27) gnr(hm[10]),
                          if (a == 10402) gnr(hm[11]),
                          if (a == 9648) gnr(hm[12]),
                          if (a == 10749) gnr(hm[13]),
                          if (a == 878) gnr(hm[14]),
                          if (a == 10770) gnr(hm[15]),
                          if (a == 53) gnr(hm[16]),
                          if (a == 10752) gnr(hm[17]),
                          if (a == 37) gnr(hm[18]),
                        ],
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        votestar(voteaverage, 15),
                        Text(
                          voteaverage.toString(),
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.bar_chart,
                          color: Colors.amber,
                        ),
                        Text(
                          populary.toString(),
                          style: TextStyle(color: Colors.amber, fontSize: 12),
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
    ),
  );
}
