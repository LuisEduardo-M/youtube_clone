import 'package:flutter/material.dart';
import 'package:youtube_clone/app/utils/app_colors.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 110,
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) => const Card(
                child: Center(
                  child: Text('    YouTube Video    '),
                ),
              ),
            ),
          ),
        ),
        const Divider(color: AppColors.dividerColor),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            label: const Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.history,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            label: const Text(
              'Your Videos',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.play_arrow_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            label: const Text(
              'Your movies',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.local_movies_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            label: const Text(
              'Watch later',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            label: const Text(
              'Your clips',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.cut_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        const Divider(color: AppColors.dividerColor),
        const Text(
          ' Playlists',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            label: const Text(
              'New playlist',
              style: TextStyle(color: Colors.lightBlue),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.lightBlue,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
