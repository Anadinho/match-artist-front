import 'package:flutter/cupertino.dart';
import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/models/evento_model.dart';
import 'package:front_end/repositories/contract/i_agenda_repository.dart';
import 'package:get/get.dart';
import 'package:front_end/repositories/contract/i_agenda_repository.dart';

class AgendaController extends GetxController with StateMixin {
  final IAgendaRepository _agendaRepository;

  AgendaController(
    this._agendaRepository,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    findAllAgendaEstabelecimento();
  }

  ValueNotifier<List<AgendaModel>> agendas =
      ValueNotifier<List<AgendaModel>>([]);

  void findAllAgendaEstabelecimento() async {
    change([], status: RxStatus.loading());
    try {
      agendas.value = await _agendaRepository.findAllAgendaEstabelecimento();
      change(agendas.value, status: RxStatus.success());
    } catch (e) {
      change([],
          status: RxStatus.error('Erro ao buscar agenda estabelecimento'));
    }
  }

  void findAllAgendaArtista() async {
    change([], status: RxStatus.loading());
    try {
      agendas.value = await _agendaRepository.findAllAgendaArtista();
      change(agendas.value, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar agenda artista'));
    }
  }

  store(int artistaId, String descricao, EventoModel evento) async {
    change([], status: RxStatus.loading());
    print(descricao);

    final dados = await _agendaRepository.storeAgendaEstabelecimento(
        artistaId, descricao, evento);
    change(dados, status: RxStatus.success());
    return dados;
  }
}
