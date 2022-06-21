import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_artist/artist_appbar.dart';
import 'package:front_end/pages/home/home_artist/artist_drawer.dart';
import 'package:front_end/pages/home/home_company/company_appbar.dart';
import 'package:front_end/pages/home/home_company/company_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custom_colors.dart';

class HomePageArtista extends StatefulWidget {
  const HomePageArtista({Key? key}) : super(key: key);

  @override
  State<HomePageArtista> createState() => _HomePageArtista();
}

class _HomePageArtista extends State<HomePageArtista> {
  // final EstabelecimentoController _controller =
  // EstabelecimentoController(EstabelecimentoRepository());
//
  // @override
  // void initState() {
  // super.initState();
  // _controller.findAllEstabelecimentos();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getArtistAppBar(),
      drawer: ArtistDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CustomColors().getBackGround()),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

Future<bool> sair() async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  await sharedPreference.clear();
  return true;
}
