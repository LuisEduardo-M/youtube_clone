import 'package:flutter/material.dart';
import 'package:youtube_clone/app/data/models/custom_search_delegate.dart';
import 'package:youtube_clone/app/pages/home_page.dart';
import 'package:youtube_clone/app/pages/library_page.dart';
import 'package:youtube_clone/app/pages/shorts_page.dart';
import 'package:youtube_clone/app/pages/subscriptions_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  String _res = '';
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(
        search: _res,
      ),
      const ShortsPage(),
      const SubscriptionsPage(),
      const LibraryPage(),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 100),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 100),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Image.asset('assets/images/logo.png',
            fit: BoxFit.contain, width: 40, height: 90),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String? result = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _res = result!;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 100),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Shorts',
            icon: Icon(Icons.whatshot_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Subscriptions',
            icon: Icon(Icons.subscriptions_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Library',
            icon: Icon(Icons.library_books_outlined),
          ),
        ],
      ),
    );
  }
}
