import 'dart:convert';

import 'package:front_end/models/endereco_model.dart';

class ArtistaModel {
  int id;
  String nome;
  String contato;
  String descricao;
  String genero;
  int user_id;
  EnderecoModel endereco;

  ArtistaModel({
    required this.id,
    required this.nome,
    required this.contato,
    required this.descricao,
    required this.genero,
    required this.user_id,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nome': nome});
    result.addAll({'contato': contato});
    result.addAll({'descricao': descricao});
    result.addAll({'genero': genero});
    result.addAll({'user_id': user_id});
    result.addAll({'endereco': endereco.toMap()});

    return result;
  }

  factory ArtistaModel.fromMap(Map<String, dynamic> map) {
    return ArtistaModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      contato: map['contato'] ?? '',
      descricao: map['descricao'] ?? '',
      genero: map['genero'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      endereco: EnderecoModel.fromMap(map['endereco']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistaModel.fromJson(String source) =>
      ArtistaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArtistaModel(id: $id, nome: $nome, contato: $contato, descricao: $descricao, genero: $genero, user_id: $user_id, endereco: $endereco)';
  }
}
