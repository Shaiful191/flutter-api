import 'package:flutter/material.dart';
import 'package:talikhata/View/read_api.dart';
import 'package:talikhata/View/post_api.dart';

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
        theme: ThemeData(
          primaryColor: Color(0xFF0C9869),
        ),
        title: 'API',
        home: PostApi()
        // home: Read()
        );
  }
}
