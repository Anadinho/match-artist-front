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
  void initState(){
    super.initState();
    verficaToken().then((value) {
      if(value){
        if (true) {
          print("ESTABELECIMENTO");
          // Navigator.of(context).pushReplacementNamed('/homeEstabelecimento');        
        } else {
          print("artista");
          // Navigator.of(context).pushReplacementNamed('/homeArtista');
        }
      }else{
        Navigator.of(context).pushReplacementNamed('/login');
        print("Realizar Login");
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child:CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> verficaToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.getString('acess_token') != null) {
      return true;
    } else {
      return false;
    }
  }

}
