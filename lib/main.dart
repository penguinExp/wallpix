import 'package:flutter/material.dart';
import 'package:wallpix/imgview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallPix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageUI(),
    );
  }
}
