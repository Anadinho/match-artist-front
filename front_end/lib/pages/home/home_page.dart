import 'package:flutter/material.dart';
import 'package:front_end/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    verficaToken().then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (value) {
        if (sharedPreferences.getString('role') == "2") {
          // print("artista");
          Navigator.of(context).pushReplacementNamed('/artista');
        } else {
          Navigator.of(context).pushReplacementNamed('/estabelecimento');
        }
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Home",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () async {
                bool is_sair = await sair();
                if (is_sair) {
                  Navigator.of(context).pushReplacementNamed('/homePage');
                }
              },
              child: Text('Sair'),
            )
          ],
        ));
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

  Future<bool> sair() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.clear();
    return true;
  }
}