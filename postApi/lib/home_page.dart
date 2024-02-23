import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dataModel.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel ?dataModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  var datafromapi;

  Future<DataModel?> submitData(String name, String job) async {
    var response = await http.post(Uri.https('reqres.in', 'api/users'), body: {
      'name': name,
      'job': job,
    });
    var data = response.body;
    datafromapi=data;
    
    print(data);
    if (response.statusCode == 201) {
      //String responseString = response.body;
      //DataModel.fromJson(jsonDecode(data));
      return DataModel.fromJson(jsonDecode(data));
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Post")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Name here"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter job title here"),
            ),
            ElevatedButton(
                onPressed: () async {
                  String name = nameController.text;
                  String job = jobController.text;
                   dataModel = await submitData(name, job);
                  //print(data?.name);
                  setState(() {
                   // dataModel = data!;
                    print(dataModel?.name);
                   // datafromapi=data;
                  });
                },
                child: Text('Submit')),

           SizedBox(height: 20,),
           Text(dataModel?.createdAt.toString() ?? "0"),
          ],
        ),
      ),
    );
  }
}
