import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:talikhata/neviasoft/edd.dart';
import 'package:talikhata/neviasoft/loginModel.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginModel ?loginModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var datafromapi;

  Future<LoginModel?> submitData(String email, String password) async {
    var response = await http.post(Uri.parse('http://safihealth.org/api/login'), body: {
      'email': email,
      'password': password,
      'type':"5",
    });
    var data = response.body;
    print(data);

    datafromapi=data;
    
    print(data);
    if (response.statusCode == 200) {
      //String responseString = response.body;
      //DataModel.fromJson(jsonDecode(data));
      return LoginModel.fromJson(jsonDecode(data));
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
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Email here"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password here"),
            ),
            ElevatedButton(
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                   loginModel = await submitData(email, password);
                  //print(data?.name);
                  setState(() {
                   // dataModel = data!;
                  //  print(loginModel!.user?.phone);
                   // datafromapi=data;
                  });
                  Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Nami()),
                   );
                },
                child: Text('Submit')),

           SizedBox(height: 20,),
           Text(loginModel?.user?.phone.toString() ?? "0"),
          ],
        ),
      ),
    );
  }
}
