import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:talikhata/API/apiService.dart';

import '../Model/usermodel.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  UserModel? user;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  // Future<UserModel?> submitData(String name, String job) async {
  //   var response = await http.post(Uri.https('reqres.in', 'api/users'), body: {
  //     'name': name,
  //     'job': job,
  //   });
  //   var data = response.body;

  //   print(data);
  //   if (response.statusCode == 201) {
  //     //String responseString = response.body;
  //     //DataModel.fromJson(jsonDecode(data));
  //     return UserModel.fromJson(jsonDecode(data));
  //   } else
  //     return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Post")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SizedBox(
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    String name = nameController.text;
                    String job = jobController.text;
                    user = await ApiService.submitData(name, job);
                    //print(data?.name);
                    setState(() {
                      // dataModel = data!;
                      print(user?.name);
                      // datafromapi=data;
                    });
                  },
                  child: Text('Submit')),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Founded Result:",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(user?.id.toString() ?? "0"),
                    Text(user?.name.toString() ?? "Shaiful Islam"),
                    Text(user?.job.toString() ?? "Software engineer"),
                    Text(user?.createdAt.toString() ?? "Now"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
