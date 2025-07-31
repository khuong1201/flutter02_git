import 'package:flutter/material.dart';
import 'package:my_app/Pages/page_home.dart';
import 'package:my_app/Pages/page_search.dart';
import 'package:my_app/db/ui_db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UiDb(),
      routes: {
        '/search': (context) => const PageSearch(),
      },
    );
  }
}

