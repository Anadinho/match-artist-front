import 'package:front_end/models/agenda_model.dart';

abstract class IAgendaRepository {
  Future<List<AgendaModel>> findAllAgendaEstabelecimento();
}
