import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  onPressed: () {
                    login();

                    // Navigator.of(context)
                    //     .pushReplacementNamed('/homeArtista');
                  },
                  child: Text('Entrar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> verficaToken() async {
  //   SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  //   if (sharedPreference.getString('acess_token') != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse("https://match-artist.herokuapp.com/api/login");

    var response =
        await http.post(url, body: {'email': email, "password": password});

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['role'] == 3) {
        // Navigator.of(context).pushReplacementNamed('/homeEstabelecimento');
        print(jsonDecode(response.body)['role']);
      } else {
        Navigator.of(context).pushReplacementNamed('/homeArtista');
        print(jsonDecode(response.body)['role']);
      }
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }
}
