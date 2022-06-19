import 'package:flutter/cupertino.dart';
import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/models/evento_model.dart';
import 'package:front_end/repositories/contract/i_evento_repository.dart';
import 'package:get/get.dart';
import 'package:front_end/repositories/contract/i_evento_repository.dart';

class EventoController extends GetxController with StateMixin {
  final IEventoRepository _eventoRepository;

  EventoController(
    this._eventoRepository,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    findAllEventoEstabelecimento();
  }

  ValueNotifier<List<EventoModel>> eventos =
      ValueNotifier<List<EventoModel>>([]);

  void findAllEventoEstabelecimento() async {
    change([], status: RxStatus.loading());
    try {
      eventos.value = await _eventoRepository.findAllEventoEstabelecimento();
      change(eventos.value, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar eventos'));
    }
  }

  store(String name, String descricao, String data) async {
    change([], status: RxStatus.loading());

    final dados = await _eventoRepository.storeEventoEstabelecimento(
        name, descricao, data);
    change(dados, status: RxStatus.success());
    return dados;
  }
}
