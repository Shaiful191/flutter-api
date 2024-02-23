import 'package:flutter/material.dart';
import 'package:talikhata/API/apiService.dart';


class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Button label'),
          onPressed: () {
            print("object");
            ApiService.read();
            //aita akhono kaj kora baki ase.

          },
        ),
      ),
    );
  }
}
