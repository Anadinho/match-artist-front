import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/repositories/agenda_repository.dart';

class AgendaArtistaPage extends StatefulWidget {
  const AgendaArtistaPage({Key? key}) : super(key: key);

  @override
  State<AgendaArtistaPage> createState() => _AgendaArtistaPageState();
}

class _AgendaArtistaPageState extends State<AgendaArtistaPage> {
  final AgendaController _controller = AgendaController(AgendaRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.findAllAgendaArtista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Solicitações'),
          centerTitle: true,
          backgroundColor: CustomColors().getBlueColorSecond(),
        ),
        body: ValueListenableBuilder<List<AgendaModel>>(
          valueListenable: _controller.agendas,
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
                itemBuilder: (_, idx) => ListTile(
                  contentPadding: EdgeInsets.all(0),
                  // leading: Text(list[idx].id.toString()),
                  // trailing: Icon(Icons.arrow_forward),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: Color.fromARGB(255, 0, 3, 60)),
                        padding: EdgeInsets.all(10),
                        child: Text(list[idx].artista,
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 16)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Text(list[idx].evento.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Text(list[idx].is_artista,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.grey[200],
                        ),
                        child: Text(list[idx].evento,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14)),
                      ),
                    ],
                  ),
                  // onTap: () => Navigator.of(context)
                  //     .pushNamed('/subIndexArtista', arguments: list[idx]),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    Padding(padding: EdgeInsets.all(8)),
              ),
            );
          },
        ));
  }
}
 
 
 
 
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('AGENDA'),
  //     ),
  //     body: controller.obx((state) {
  //       return ListView.builder(
  //           itemCount: state.length,
  //           itemBuilder: (_, index) {
  //             final AgendaModel item = state[index];
  //             return ListTile(
  //               title: Text("${item.id} -" +
  //                   item.artista +
  //                   " " +
  //                   item.evento +
  //                   "-" +
  //                   item.is_artista),
  //             );
  //           });
  //     }, onError: (error) {
  //       return Center(child: Text(error!));
  //     }),
  //   );
  // }

