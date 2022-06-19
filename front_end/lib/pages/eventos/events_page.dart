import 'package:flutter/material.dart';
import 'package:front_end/components/custom_colors.dart';
import 'package:front_end/pages/eventos/events_modal_add.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
          centerTitle: true,
          backgroundColor: CustomColors().getBlueColorSecond(),
        ));
  }
}
