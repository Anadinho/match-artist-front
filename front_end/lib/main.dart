import 'package:flutter/material.dart';
import 'package:front_end/bindings/agenda_bindings.dart';
import 'package:front_end/bindings/artista_bindings.dart';
import 'package:front_end/bindings/estabelecimento_bindings.dart';
import 'package:front_end/pages/agenda/agenda_estabelecimento_index_page.dart';
import 'package:front_end/pages/artista/artista_index_page.dart';
import 'package:front_end/pages/artista/artista_page.dart';
import 'package:front_end/pages/artista/register_artista_page.dart';
import 'package:front_end/pages/artista/sub/sub_artista_index.dart';
import 'package:front_end/pages/estabelecimento/estabelecimento_index_page.dart';
import 'package:front_end/pages/estabelecimento/estabelecimento_page.dart';
import 'package:front_end/pages/estabelecimento/register_estabelecimento_page.dart';
import 'package:front_end/pages/eventos/events_page.dart';
import 'package:front_end/pages/home/home_page.dart';
import 'package:front_end/pages/home/home_page_estabelecimento.dart';
import 'package:front_end/pages/login/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => HomePage(), children: [
          GetPage(
            name: '/indexArtista',
            page: () => ArtistaIndexPage(),
            binding: ArtistaBindings(),
          ),
          GetPage(
            name: '/indexEstabelecimento',
            page: () => EstabelecimentoIndexPage(),
            binding: EstabelecimentoBindings(),
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
            page: () => HomePageEstabelecimento(),
            binding: ArtistaBindings(),
          ),
          GetPage(
            name: '/agendaEstabelecimento',
            page: () => AgendaEstabelecimentoPage(),
            binding: AgendaEstabelecimentoBindings(),
          ),
          GetPage(
            name: '/subIndexArtista',
            page: () => SubArtistaIndex(),
          ),
          GetPage(
            name: '/eventos',
            page: () => EventsPage(),
          ),
          /*  GetPage(
            name: '/estabeleciment1',
            page: () => EstabelecimentoPage(),
          ), */
        ])
      ],
    );
  }
}
