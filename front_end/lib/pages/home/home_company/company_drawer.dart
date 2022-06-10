import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/pages/artista/artista_index_page.dart';
import 'package:front_end/pages/home/home_page2.dart';

import 'company_serch_artist.dart';

class CompanyDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'TecnoBar';
    final email = 'tecnobar@gmail.com';
    final urlImage =
        'https://images.unsplash.com/photo-1468056961052-15507578a50d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774';

    return Drawer(
      child: Material(
        color: CustomColors().getBlueColorPrimary(),
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage, name: name, email: email, onCliCked: () {}),
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
                    text: 'Artistas',
                    icon: Icons.hail,
                    onCliCked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuitem(
                    text: 'Eventos',
                    icon: Icons.add_business_rounded,
                    onCliCked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuitem(
                    text: 'Agenda',
                    icon: Icons.calendar_month,
                    onCliCked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildHeader({
    required String urlImage,
    required String name,
    required String email,
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )
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
        builder: (context) => HomePageTwo(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ArtistaIndexPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CompanySerchArtist(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CompanySerchArtist(),
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
