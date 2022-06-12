import 'package:flutter/material.dart';
import 'package:front_end/bindings/agenda_bindings.dart';
import 'package:front_end/controllers/agenda_controller.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/models/agenda_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AgendaEstabelecimentoPage extends GetView<AgendaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGENDA'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final AgendaModel item = state[index];
              return ListTile(
                title: Text("${item.id} -" +
                    item.artista +
                    " " +
                    item.evento +
                    "-" +
                    item.is_artista),
              );
            });
      }, onError: (error) {
        return Center(child: Text(error!));
      }),
    );
  }
}
