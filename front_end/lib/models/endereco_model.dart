import 'dart:convert';

class EnderecoModel {
  int id;
  String logradouro;
  String complemento;
  String numero;
  String cidade;
  String estado;
  EnderecoModel({
    required this.id,
    required this.logradouro,
    required this.complemento,
    required this.numero,
    required this.cidade,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'logradouro': logradouro});
    result.addAll({'complemento': complemento});
    result.addAll({'numero': numero});
    result.addAll({'cidade': cidade});
    result.addAll({'estado': estado});

    return result;
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      id: map['id']?.toInt() ?? 0,
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      numero: map['numero'] ?? '',
      cidade: map['cidade'] ?? '',
      estado: map['estado'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
