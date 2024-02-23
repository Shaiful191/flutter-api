import 'package:flutter/material.dart';
import 'package:talikhata/amne/amne.dart';

class Jj extends StatefulWidget {
  const Jj({ Key? key }) : super(key: key);

  @override
  _JjState createState() => _JjState();
}

class _JjState extends State<Jj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child:   ElevatedButton(
  
    child: const Text('Button label'),
  
    onPressed: () {
  print("object");
      ApiService.read();
  
    },
  
  ),
),      
    );
  }
}