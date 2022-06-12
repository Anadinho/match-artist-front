import 'dart:convert';
import 'package:front_end/models/estabelecimento_model.dart';
import 'package:front_end/repositories/contract/i_estabelecimento_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EstabelecimentoRepository implements IEstabelecimentoRepository {
  @override
  Future<EstabelecimentoModel> findAllEstabelecimentos() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final acess_token = sharedPreference.getString('acess_token');
    final id_estabelecimento = sharedPreference.getString('id_estabelecimento');

    Map<String, String> header = {
      'authorization': "${acess_token}",
      'Accept': "application/json"
    };

    final response = await http.get(
        Uri.parse(
            'https://match-artist.herokuapp.com/api/estabelecimento/${id_estabelecimento}'),
        headers: header);

    // Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    // return EstabelecimentoModel.fromMap(json);

    final Map<String, dynamic> responseMap = jsonDecode(response.body)['data'];

    print(responseMap);
    return EstabelecimentoModel.fromMap(responseMap);
  }
}
