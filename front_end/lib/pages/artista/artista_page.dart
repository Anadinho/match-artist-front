import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistaPage extends StatefulWidget {
  @override
  State<ArtistaPage> createState() {
    return ArtistaPageState();
  }
}

class ArtistaPageState extends State<ArtistaPage> {
  @override
  void initState() {
    super.initState();
    verficaToken().then((value) {
      if (value) {
        print("token ok!");
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
        print("Falha no token !!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArtistaPage'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  //isolar função em um validation
  Future<bool> verficaToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.getString('acess_token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
