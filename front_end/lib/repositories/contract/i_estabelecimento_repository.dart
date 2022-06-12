import 'package:front_end/models/artista_model.dart';
import 'package:front_end/models/estabelecimento_model.dart';

abstract class IEstabelecimentoRepository {
  Future<EstabelecimentoModel> findAllEstabelecimentos();
}
