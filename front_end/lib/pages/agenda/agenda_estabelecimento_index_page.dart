import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/repositories/agenda_repository.dart';

class AgendaEstabelecimentoPage extends StatefulWidget {
  const AgendaEstabelecimentoPage({Key? key}) : super(key: key);

  @override
  State<AgendaEstabelecimentoPage> createState() =>
      _AgendaEstabelecimentoPageState();
}

class _AgendaEstabelecimentoPageState extends State<AgendaEstabelecimentoPage> {
  final AgendaController _controller = AgendaController(AgendaRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.findAllAgendaEstabelecimento();
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
                          Text(list[idx].id.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          Text(list[idx].artista,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          Text(list[idx].is_artista,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12)),
                          Text(list[idx].evento,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                        ],
                      ),
                      // onTap: () => Navigator.of(context)
                      //     .pushNamed('/subIndexArtista', arguments: list[idx]),
                    ),
                  ),
                  actionExtentRatio: 0.25,
                  actionPane: const SlidableDrawerActionPane(),
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

