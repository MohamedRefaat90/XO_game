import 'package:flutter/material.dart';

import 'Home-BomBoOo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff00061a),
        shadowColor: const Color(0x0ff01456),
        splashColor: const Color(0xff4169e8),
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
