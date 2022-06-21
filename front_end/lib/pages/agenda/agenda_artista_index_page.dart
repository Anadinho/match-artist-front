import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/repositories/agenda_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
                        child: Text(
                            list[idx].id.toString() +
                                " - " +
                                list[idx].estabelecimento,
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 16)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: TextButton(
                          onPressed: () async {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: list[idx].is_artista == "SIM"
                                    ? const Text('Evento aceito!!')
                                    : const Text('Evento Cancelado!!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => {
                                      confirmarAgenda(list[idx]),
                                      Navigator.pop(context),
                                      Navigator.of(context)
                                          .pushNamed('agendaArtistaPage'),
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: list[idx].is_artista == "NAO"
                              ? Text('Aceitar')
                              : Text('Cancelar'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Text(list[idx].nome_evento,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
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
                        child: Text(convertData(list[idx].evento),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14)),
                      ),
                      // TextButton(
                      //   onPressed: () async {
                      //     showDialog<String>(
                      //       context: context,
                      //       builder: (BuildContext context) => AlertDialog(
                      //         title: const Text('Evento aceito!!'),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () => Navigator.popAndPushNamed(
                      //                 context, '/agendaArtistaPage'),
                      //             child: const Text('OK'),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   child: Text('Aceitar'),
                      // ),
                      // TextButton(
                      //   onPressed: () async {
                      //     showDialog<String>(
                      //       context: context,
                      //       builder: (BuildContext context) => AlertDialog(
                      //         title: const Text('Evento Cancelado!!'),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () => Navigator.popAndPushNamed(
                      //                 context, '/agendaArtistaPage'),
                      //             child: const Text('OK'),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   child: Text('Cancelar'),
                      // ),
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

  String convertData(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('dd/MM/yyyy - HH:mm').format(dateTime);
  }
}

confirmarAgenda(AgendaModel model) async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  final acess_token = sharedPreference.getString('acess_token');

  Map<String, String> header = {
    'authorization': "${acess_token}",
    'Accept': "application/json"
  };

  var url =
      Uri.parse("https://match-artist.herokuapp.com/api/agenda/${model.id}");

  print(url);

  if (model.is_artista == "NAO") {
    var response =
        await http.put(url, headers: header, body: {"is_artista": "SIM"});
  }

  if (model.is_artista == "SIM") {
    var response =
        await http.put(url, headers: header, body: {"is_artista": "NAO"});
  }

  // print(response.body);
}
