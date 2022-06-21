import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/controllers/evento_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/models/evento_model.dart';
import 'package:front_end/repositories/agenda_repository.dart';
import 'package:front_end/repositories/evento_repository.dart';
import 'package:front_end/util/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class SubArtistaIndex extends StatefulWidget {
  const SubArtistaIndex({Key? key}) : super(key: key);

  @override
  State<SubArtistaIndex> createState() => _SubArtistaIndexState();
}

class _SubArtistaIndexState extends State<SubArtistaIndex> {
  DateTime _date = DateTime.now();
  TextEditingController dateCtl = TextEditingController();

  Future<Null> _selectcDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _date) {
      setState(() {
        dateCtl.text = picked.toIso8601String();
      });
    }
  }

  final _descricaoController = TextEditingController();
  int? idEvento;
  String descricao = '';

  final AgendaController _controllerAgenda =
      AgendaController(AgendaRepository());

  final EventoController _controllerEvento =
      EventoController(EventoRepository());

  final EventoRepository _eventoRepository = EventoRepository();

  EventoModel? eventoModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.idEvento;
    _calendar = Calendar();
  }

  @override
  Widget build(BuildContext context) {
    ArtistaModel artista =
        ModalRoute.of(context)!.settings.arguments as ArtistaModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Proposta'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            /*  gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CustomColors().getBackGround()), */
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artista.nome,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              artista.contato,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              artista.descricao,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              artista.genero,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              artista.endereco.cidade + " - " + artista.endereco.estado,
              style: TextStyle(fontSize: 16),
            ),
            // ignore: deprecated_member_use
            FutureBuilder<List<EventoModel>>(
                future: _eventoRepository.findAllEventoEstabelecimento(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    final List<EventoModel> evento = snapshot.data!;
                    return DropdownButton<EventoModel>(
                        hint: const Text('Evento'),
                        value: eventoModel,
                        items: evento
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.nome),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) => {
                              setState(() {
                                eventoModel = value as EventoModel;
                              })
                            });
                  }
                }),
            /*   ValueListenableBuilder(
                  valueListenable: _controllerEvento.eventos,
                  builder: (BuildContext context, String value, _) {
                    return DropdownButton<String>(
                        value: (value.isEmpty) ? null : value,
                        onChanged: (escolha) => _controllerEvento
                            .eventos.value = escolha.toString());
                  }), */
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Digite uma mensagem para o artista:',
                // labelStyle: TextStyle(color: CustomColors().getWordColor()),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: CustomColors().getWordColor(),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: CustomColors().getWordColor(),
                  ),
                ),
              ),
              controller: _descricaoController,
              keyboardType: TextInputType.text,
            ),
            TextButton(
              onPressed: () async {
                final res = await _controllerAgenda.store(
                    artista.id, _descricaoController.text, eventoModel?.id);
                if (res.first == 'ok') {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Proposta enviada com sucesso!!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.popAndPushNamed(
                              context, '/estabelecimento'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Enviar Proposta'),
            ),
          ],
        ),
      ),
    );
  }
}
