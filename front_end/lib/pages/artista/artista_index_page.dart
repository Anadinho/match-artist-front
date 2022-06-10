import 'package:flutter/material.dart';
import 'package:front_end/controllers/artista_controller.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ArtistaIndexPage extends GetView<ArtistaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artista'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final ArtistaModel item = state[index];
              return ListTile(
                title: Text(item.nome +
                    " " +
                    item.endereco.cidade +
                    "-" +
                    item.endereco.estado),
              );
            });
      }, onError: (error) {
        return Center(child: Text(error));
      }),
    );
  }
}
