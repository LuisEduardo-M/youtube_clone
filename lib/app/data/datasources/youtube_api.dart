import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_clone/app/data/models/videos.dart';

const youtubeApiKey = 'AIzaSyAOwmRtIEHMb8ABRIkiuzhCfg1g-7M_nXo';

const channelId = 'UC-GAhNmY6bkuuRPUSaRI_oQ';

const baseUrl = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> search(String search) async {
    http.Response response = await http.get(
      Uri.parse(baseUrl +
          'search'
              '?part=snippet'
              '&type=video'
              '&maxResults=20'
              '&order=date'
              '&key=$youtubeApiKey'
              '&channelId=$channelId'
              '&q=$search'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> dataJson = jsonDecode(response.body);
      List<Video> videos = dataJson['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      print(response.statusCode);
    }
    return response as Future<List<Video>>;
  }
}
