import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        textTheme: const TextTheme(headline6: TextStyle(color: Colors.white)),
        hintColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 24, 100),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(24, 24, 24, 100),
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear_outlined),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container(
      color: const Color.fromRGBO(24, 24, 24, 100),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(24, 24, 24, 100),
    );
  }
}
