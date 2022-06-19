import 'package:front_end/models/evento_model.dart';

abstract class IEventoRepository {
  Future<List<EventoModel>> findAllEventoEstabelecimento();
  Future storeEventoEstabelecimento(String name, String descricao, String Data);
}
