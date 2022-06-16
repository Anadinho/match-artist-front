import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/repositories/artista_repository.dart';

class ArtistaIndexPage extends StatefulWidget {
  const ArtistaIndexPage({Key? key}) : super(key: key);

  @override
  State<ArtistaIndexPage> createState() => _ArtistaIndexPageState();
}

class _ArtistaIndexPageState extends State<ArtistaIndexPage> {
  final ArtistaController _controller = ArtistaController(ArtistaRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.findArtistas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<List<ArtistaModel>>(
      valueListenable: _controller.artistas,
      builder: (_, list, __) {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (_, idx) => ListTile(
            // leading: Text(list[idx].id.toString()),
            // trailing: Icon(Icons.arrow_forward),
            title: Text(
              list[idx].nome +
                  "\n" +
                  list[idx].genero +
                  "\n" +
                  list[idx].endereco.cidade +
                  " - " +
                  list[idx].endereco.estado,
            ),

            onTap: () => Navigator.of(context)
                .pushNamed('/subIndexArtista', arguments: list[idx]),
          ),
          separatorBuilder: (_, __) => Divider(),
        );
      },
    ));
  }
}
