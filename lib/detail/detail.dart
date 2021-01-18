import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowmov/model/config.dart';
import 'package:nowmov/model/modeldetail.dart';
import 'package:http/http.dart' as http;
import 'package:nowmov/nowplaying/widgetnowplaying.dart';
import 'package:nowmov/style/maincss.dart';

class Detail extends StatefulWidget {
  final int id;
  Detail(this.id);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool load = true;
  ModelDetail modelDetail1;
  Future getDetail(int id) async {
    String url = head + "$id?api_key=$key&language=en-US&page=1";
    var res = await http.get(url);
    if (res.statusCode == 200) {
      setState(() {});
      load = false;
      final modelDetail = modelDetailFromJson(res.body);
      modelDetail1 = modelDetail;
      print(modelDetail.backdropPath);
    }
  }

  @override
  void initState() {
    super.initState();
    getDetail(widget.id);
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var a = modelDetail1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.only(
            left: 15,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primary,
            boxShadow: [BoxShadow(color: primary, blurRadius: 10)],
          ),
          child: InkWell(
            onTap: () => Get.back(),
            child: SizedBox.expand(
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: second,
      body: load
          ? SizedBox.expand(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: Get.width,
                    height: 330,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          bottom: 60,
                          left: 0,
                          right: 0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: poster(gambar1 + a.backdropPath),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [second, Colors.transparent],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 15,
                          right: 15,
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: primary, blurRadius: 10)
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: poster(gambar2 + a.posterPath),
                                ),
                              ),
                              Positioned(
                                left: 145,
                                child: Column(
                                  children: [
                                    Text(
                                      a.title,
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 145,
                                bottom: 0,
                                child: Row(
                                  children: [
                                    votestar(a.voteAverage, 20),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      a.voteAverage.toString(),
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
