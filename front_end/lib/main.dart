import 'package:flutter/material.dart';
import 'package:front_end/bindings/artista_bindings.dart';
import 'package:front_end/pages/artista/artista_index_page.dart';
import 'package:front_end/pages/artista/artista_page.dart';
import 'package:front_end/pages/artista/register_artista_page.dart';
import 'package:front_end/pages/estabelecimento/estabelecimento_page.dart';
import 'package:front_end/pages/estabelecimento/register_estabelecimento_page.dart';
import 'package:front_end/pages/home/home_page.dart';
import 'package:front_end/pages/home/home_page2.dart';
import 'package:front_end/pages/login/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => HomePage(), children: [
          GetPage(
            name: '/indexArtista',
            page: () => ArtistaIndexPage(),
            binding: ArtistaBindings(),
          ),
          GetPage(
            name: '/login',
            page: () => LoginPage(),
          ),
          GetPage(
            name: '/artista',
            page: () => ArtistaPage(),
          ),
          GetPage(
            name: '/novoArtista',
            page: () => RegisterArtistaPage(),
          ),
          GetPage(
            name: '/novoEstabelecimento',
            page: () => RegisterEstabelecimentoPage(),
          ),
          GetPage(
            name: '/estabelecimento',
            page: () => EstabelecimentoPage(),
          ),
          GetPage(
            name: '/teste',
            page: () => HomePageTwo(),
            binding: ArtistaBindings(),
          ),
        ])
      ],
    );
  }
}
