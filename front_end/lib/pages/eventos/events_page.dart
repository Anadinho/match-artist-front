import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/evento_controller.dart';
import 'package:front_end/models/evento_model.dart';
import 'package:front_end/pages/eventos/events_modal_add.dart';
import 'package:front_end/repositories/evento_repository.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final EventoController _controller = EventoController(EventoRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.findAllEventoEstabelecimento();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(
            "+",
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            showBarModalBottomSheet(
                context: context, builder: (context) => EventsModalAdd());
          },
          backgroundColor: CustomColors().getBlueColorSecond(),
        ),
        appBar: AppBar(
          title: Text('Eventos'),
          leading: IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/estabelecimento'),
            },
            icon: Icon(Icons.arrow_back),
          ),

          centerTitle: true,
          // trailing: Icon(Icons.arrow_forward),
          backgroundColor: CustomColors().getBlueColorSecond(),
        ),
        body: ValueListenableBuilder<List<EventoModel>>(
          valueListenable: _controller.eventos,
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
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      // leading: Text(list[idx].id.toString()),
                      // trailing: Icon(Icons.arrow_forward),
                      title: Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('lib/assets/event.jpeg'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nome:  " + list[idx].nome,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                                SizedBox(height: 10),
                                Text(
                                  list[idx].descricao,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Dia:  \n" + list[idx].data,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // onTap: () => Navigator.of(context)
                      //     .pushNamed('/subIndexArtista', arguments: list[idx]),
                    ),
                  ),
                  actionExtentRatio: 0.25,
                  actionPane: const SlidableDrawerActionPane(),
                  secondaryActions: [
                    IconSlideAction(
                      caption: 'Ver Evento',
                      color: CustomColors().getBlueColorSecond(),
                      icon: Icons.event,
                      // onTap: () => Navigator.of(context)
                      //     .pushNamed('/subIndexArtista', arguments: list[idx]),
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
