import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/models/agenda_register_model.dart';

abstract class IAgendaRepository {
  Future<List<AgendaModel>> findAllAgendaEstabelecimento();
  Future<List<dynamic>> storeAgendaEstabelecimento(int artistaId);
}
