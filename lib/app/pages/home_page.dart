import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/app/data/datasources/youtube_api.dart';
import 'package:youtube_clone/app/data/models/videos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  String search;

  HomePage({Key? key, required this.search}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _listVideos(String search) {
    Api api = Api();

    return api.search(search);
  }

  //
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: kIsWeb ? screenSize.height / 1.1 : screenSize.height,
      width: screenSize.width,
      child: FutureBuilder<List<Video>>(
        future: _listVideos(widget.search),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];

                    return GestureDetector(
                      onTap: () {
                        YoutubePlayer(
                          showVideoProgressIndicator: true,
                          controller: YoutubePlayerController(
                            initialVideoId: video.id,
                            flags: const YoutubePlayerFlags(
                              autoPlay: false,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.image),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              video.title,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              video.channel,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: Text(''),
              );
          }
        },
      ),
    );
  }
}
