import 'dart:convert';

import 'package:front_end/models/endereco_model.dart';

class EstabelecimentoModel {
  int id;
  String nome;
  String contato;
  String cnpj;
  String descricao;
  String genero;
  int user_id;
  EnderecoModel endereco;
  EstabelecimentoModel({
    required this.id,
    required this.nome,
    required this.contato,
    required this.cnpj,
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
    result.addAll({'cnpj': cnpj});
    result.addAll({'descricao': descricao});
    result.addAll({'genero': genero});
    result.addAll({'user_id': user_id});
    result.addAll({'endereco': endereco.toMap()});

    return result;
  }

  factory EstabelecimentoModel.fromMap(Map<String, dynamic> map) {
    return EstabelecimentoModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      contato: map['contato'] ?? '',
      cnpj: map['cnpj'] ?? '',
      descricao: map['descricao'] ?? '',
      genero: map['genero'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      endereco: EnderecoModel.fromMap(map['endereco']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EstabelecimentoModel.fromJson(String source) =>
      EstabelecimentoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EstabelecimentoModel(id: $id, nome: $nome, contato: $contato, cnpj: $cnpj, descricao: $descricao, genero: $genero, user_id: $user_id, endereco: $endereco)';
  }

  EstabelecimentoModel copyWith({
    int? id,
    String? nome,
    String? contato,
    String? cnpj,
    String? descricao,
    String? genero,
    int? user_id,
    EnderecoModel? endereco,
  }) {
    return EstabelecimentoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      contato: contato ?? this.contato,
      cnpj: cnpj ?? this.cnpj,
      descricao: descricao ?? this.descricao,
      genero: genero ?? this.genero,
      user_id: user_id ?? this.user_id,
      endereco: endereco ?? this.endereco,
    );
  }
}
