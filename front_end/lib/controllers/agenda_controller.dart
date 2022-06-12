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

  void findAllAgendaEstabelecimento() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _agendaRepository.findAllAgendaEstabelecimento();
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar agenda'));
    }
  }
}
