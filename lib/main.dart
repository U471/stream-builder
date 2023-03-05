import 'package:flutter/material.dart';
import 'package:stream_builder/stream_builder.dart';
import 'package:stream_builder/view/home_secreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Quran App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeSecreen(),
    );
  }
}
