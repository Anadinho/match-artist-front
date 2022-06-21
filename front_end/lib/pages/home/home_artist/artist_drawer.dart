import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/pages/agenda/agenda_artista_index_page.dart';
import 'package:front_end/pages/agenda/agenda_estabelecimento_index_page.dart';
import 'package:front_end/pages/artista/artista_index_page.dart';
import 'package:front_end/pages/home/home_page_artista.dart';
import 'package:front_end/pages/home/home_page_estabelecimento.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../eventos/events_page.dart';

class ArtistDrawer extends GetView<ArtistaController> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final urlImage = 'https://cdn-icons-png.flaticon.com/512/195/195128.png';

    return controller.obx((state) {
      final ArtistaModel item = state;
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: CustomColors().getBackGround()),
          ),
          child: ListView(
            children: <Widget>[
              buildHeader(
                  urlImage: urlImage,
                  name: item.nome,
                  contato: item.contato,
                  onCliCked: () {
                    Navigator.of(context).pushReplacementNamed('/artista');
                  }),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuitem(
                      text: 'Perfil',
                      icon: Icons.people,
                      onCliCked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuitem(
                      text: 'Solicitações',
                      icon: Icons.assignment_outlined,
                      onCliCked: () => selectedItem(context, 3),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 170),
                    buildMenuitem(
                      text: 'Sair',
                      icon: Icons.exit_to_app,
                      onCliCked: () async {
                        bool is_sair = await sair();
                        if (is_sair) {
                          Navigator.of(context).pushReplacementNamed('/login');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }, onError: (error) {
      sair();
      Navigator.of(context).pushReplacementNamed('/login');
      return Center(child: Text('Erro ao carregar o perfil'));
    });
  }

  buildHeader({
    required String urlImage,
    required String name,
    required String contato,
    required VoidCallback onCliCked,
  }) =>
      InkWell(
          onTap: onCliCked,
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(urlImage),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 20, color: CustomColors().getWordColor()),
                    ),
                    Text(
                      contato,
                      style: TextStyle(
                          fontSize: 13, color: CustomColors().getWordColor()),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ));
}

selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePageArtista(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ArtistaIndexPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EventsPage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AgendaArtistaPage(),
      ));
      break;
  }
}

Widget buildMenuitem({
  required String text,
  required IconData icon,
  VoidCallback? onCliCked,
}) {
  final color = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: CustomColors().getBlueColorSecond(),
    onTap: onCliCked,
  );
}

Future<bool> sair() async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  await sharedPreference.clear();
  return true;
}
