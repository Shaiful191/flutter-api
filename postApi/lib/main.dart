import 'package:flutter/material.dart';
import 'package:talikhata/amne/jj.dart';
import 'package:talikhata/pervej/loginPage.dart';


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
      home:  Jj()
    );
  }
}


