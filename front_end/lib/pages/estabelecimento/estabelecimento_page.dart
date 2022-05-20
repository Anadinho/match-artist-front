import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EstabelecimentoPage extends StatefulWidget {
  @override
  State<EstabelecimentoPage> createState() {
    return EstabelecimentoPageState();
  }
}

class EstabelecimentoPageState extends State<EstabelecimentoPage> {
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
          title: Text('EstabelecimentoPage'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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

  Future<bool> sair() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.clear();
    return true;
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
