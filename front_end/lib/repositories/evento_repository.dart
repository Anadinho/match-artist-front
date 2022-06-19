import 'dart:convert';

import 'package:front_end/models/agenda_model.dart';
import 'package:front_end/models/agenda_register_model.dart';
import 'package:front_end/models/artista_model.dart';
import 'package:front_end/models/evento_model.dart';
import 'package:front_end/repositories/contract/i_agenda_repository.dart';
import 'package:front_end/repositories/contract/i_artista_repository.dart';
import 'package:front_end/repositories/contract/i_evento_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EventoRepository implements IEventoRepository {
  @override
  Future<List<EventoModel>> findAllEventoEstabelecimento() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');
    final id_estabelecimento = sharedPreference.getString('id_estabelecimento');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    final response = await http.get(
        Uri.parse(
            'https://match-artist.herokuapp.com/api/evento/${id_estabelecimento}'),
        headers: header);

    final List<dynamic> responseMap = jsonDecode(response.body)['data'];
    print(responseMap);
    return responseMap
        .map<EventoModel>((resp) => EventoModel.fromMap(resp))
        .toList();
  }

  @override
  Future storeEventoEstabelecimento() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');
    final id_estabelecimento = sharedPreference.getString('id_estabelecimento');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    Map<String, String> body = {
      "nome": "ESTABELECIMENTO",
      "descricao": "2022-03-25 02:02:02",
      "data": "NAO",
      "estabelecimento_id": "${id_estabelecimento}",
    };

    final response = await http.post(
        Uri.parse('https://match-artist.herokuapp.com/api/evento'),
        headers: header,
        body: body);

    final List<dynamic> responseMap = jsonDecode(response.body);

    final teste = responseMap.map((e) => e as String);
    return teste;
  }
}
