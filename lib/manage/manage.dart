import 'package:get/get.dart';
import 'package:nowmov/model/config.dart';
import 'package:nowmov/model/modelNowPlaying.dart';
import 'package:http/http.dart' as http;
import 'package:nowmov/model/modelPoppular.dart';

class Manage extends GetxController {
  ModelNowPlaying modelNowPlaying1;
  ModelPoppular modelPoppular1;
  Future getNowPlaying() async {
    String url = head + "now_playing?api_key=$key&language=en-US&page=1";
    var res = await http.get(url);
    if (res.statusCode == 200) {
      final modelNowPlaying = modelNowPlayingFromJson(res.body);
      modelNowPlaying1 = modelNowPlaying;
      update();
    }
  }

  Future getPoppular() async {
    String url = head + "popular?api_key=$key&language=en-US&page=1";
    var res = await http.get(url);
    if (res.statusCode == 200) {
      final modelPoppular = modelPoppularFromJson(res.body);
      modelPoppular1 = modelPoppular;
      update();
    }
  }
}
