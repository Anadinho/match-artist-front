import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../components/custom_colors.dart';
import '../../components/text_form_fild_patters.dart';

class EventsModalAdd extends StatefulWidget {
  const EventsModalAdd({key}) : super(key: key);

  @override
  State<EventsModalAdd> createState() => _EventsModalAddState();
}

class _EventsModalAddState extends State<EventsModalAdd> {
  final nameEvent = TextEditingController();
  final descricaoEvent = TextEditingController();
  final dateEvent = TextEditingController();

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
          TextFildFormPatters(
            controller: dateEvent,
            label: 'Data',
            iconLabel: Icons.calendar_month_rounded,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
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
