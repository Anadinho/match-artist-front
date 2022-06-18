import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/repositories/artista_repository.dart';

import '../../components/custom_colors.dart';

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
        appBar: AppBar(
          title: Text('Buscar Artista'),
          centerTitle: true,
          backgroundColor: CustomColors().getBlueColorSecond(),
        ),
        body: ValueListenableBuilder<List<ArtistaModel>>(
          valueListenable: _controller.artistas,
          builder: (_, list, __) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: CustomColors().getBackGround()),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (_, idx) => Slidable(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[200],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: ListTile(
                      // leading: Text(list[idx].id.toString()),
                      // trailing: Icon(Icons.arrow_forward),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(list[idx].nome,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          Text(
                              list[idx].endereco.cidade +
                                  ' - ' +
                                  list[idx].endereco.estado,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12)),
                          Text(list[idx].genero,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                        ],
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamed('/subIndexArtista', arguments: list[idx]),
                    ),
                  ),
                  actionExtentRatio: 0.25,
                  actionPane: const SlidableDrawerActionPane(),
                  secondaryActions: [
                    IconSlideAction(
                      caption: 'Perfil',
                      color: CustomColors().getBlueColorSecond(),
                      icon: Icons.account_circle,
                      onTap: () => Navigator.of(context)
                          .pushNamed('/subIndexArtista', arguments: list[idx]),
                    )
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    Padding(padding: EdgeInsets.all(8)),
              ),
            );
          },
        ));
  }
}
