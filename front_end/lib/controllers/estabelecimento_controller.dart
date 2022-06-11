import 'package:get/get.dart';
import 'package:front_end/repositories/contract/i_estabelecimento_repository.dart';

class EstabelecimentoController extends GetxController with StateMixin {
  final IEstabelecimentoRepository _estabelecimentoRepository;

  EstabelecimentoController(
    this._estabelecimentoRepository,
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    findAllEstabelecimentos();
  }

  void findAllEstabelecimentos() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _estabelecimentoRepository.findAllEstabelecimentos();
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar estabelecimentos'));
    }
  }
}
