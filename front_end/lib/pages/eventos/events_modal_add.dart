import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_end/controllers/evento_controller.dart';
import 'package:front_end/models/evento_model.dart';
import 'package:front_end/repositories/evento_repository.dart';

import '../../components/custom_colors.dart';
import '../../components/text_form_fild_patters.dart';

class EventsModalAdd extends StatefulWidget {
  const EventsModalAdd({key}) : super(key: key);

  @override
  State<EventsModalAdd> createState() => _EventsModalAddState();
}

class _EventsModalAddState extends State<EventsModalAdd> {
  DateTime? _dateTime;
  final EventoController _eventoController =
      EventoController(EventoRepository());

  final nameEvent = TextEditingController();
  final descricaoEvent = TextEditingController();
  late final dateEvent = TextEditingController();

  final novoEvento = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: CustomColors().getBackGround()),
      ),
      child: Form(
          child: Column(
        children: [
          AppBar(
            title: Text('Novo Evento'),
            centerTitle: true,
            backgroundColor: CustomColors().getBlueColorSecond(),
          ),
          SizedBox(height: 16),
          TextFildFormPatters(
            controller: nameEvent,
            label: 'Nome do Evento',
            iconLabel: Icons.event_available,
          ),
          SizedBox(height: 16),
          TextFildFormPatters(
            controller: descricaoEvent,
            label: 'Descrição',
            iconLabel: Icons.add_comment_rounded,
          ),
          SizedBox(height: 16),
          // TextFildFormPatters(
          //   controller: dateEvent,
          //   label: 'Data',
          //   iconLabel: Icons.calendar_month_rounded,
          // ),
          Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateEvent,
                      enabled: false,
                      style: TextStyle(color: CustomColors().getWordColor()),
                      decoration: InputDecoration(
                        labelText:
                            _dateTime == null ? 'Data' : _dateTime.toString(),
                        // labelText: _dateTime == null ? 'Data' : _dateTime.toString(),
                        labelStyle:
                            TextStyle(color: CustomColors().getWordColor()),
                        prefixIcon: Icon(
                          Icons.calendar_month_rounded,
                          color: CustomColors().getWordColor(),
                        ),
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
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: CustomColors().getActiveSecondButton()),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: CustomColors().getActivePrimaryButton(),
                        padding: EdgeInsets.all(14)),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2222))
                          .then((date) {
                        setState(() {
                          _dateTime = date!;
                          // dateEvent = _dateTime.toString();
                        });
                      });
                    },
                  ),
                ],
              )
            ],
          ),

          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final res = await _eventoController.store(nameEvent.text,
                        descricaoEvent.text, _dateTime.toString());
                    print(res);
                    if (res.first == 'ok') {
                      print("ENTROU NO IF");
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Evento criado com Sucesso!!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.popAndPushNamed(
                                  context, '/eventos'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Criar Evento'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: CustomColors().getActivePrimaryButton(),
                      padding: EdgeInsets.all(18)),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
