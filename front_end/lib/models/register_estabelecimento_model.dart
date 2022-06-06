class RegisterEstabelecimentoModel {
  final String? name;
  final String? email;
  final String? password;
  final String? cnpj;
  final String? contato;
  final String? descricao;
  final String? genero;
  final String? logradouro;
  final String? complemento;
  final String? numero;
  final String? cidade;
  final String? estado;

  RegisterEstabelecimentoModel({
    this.name,
    this.email,
    this.password,
    this.cnpj,
    this.contato,
    this.descricao,
    this.genero,
    this.logradouro,
    this.complemento,
    this.numero,
    this.cidade,
    this.estado,
  });

  RegisterEstabelecimentoModel copyWith({
    String? name,
    String? email,
    String? password,
    String? cnpj,
    String? contato,
    String? descricao,
    String? genero,
    String? logradouro,
    String? complemento,
    String? numero,
    String? cidade,
    String? estado,
  }) {
    return RegisterEstabelecimentoModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      cnpj: cnpj ?? this.cnpj,
      contato: contato ?? this.contato,
      descricao: descricao ?? this.descricao,
      genero: genero ?? this.genero,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      numero: numero ?? this.numero,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
    );
  }

  @override
  String toString() =>
      "RegisterEstabelecimentoModel(name: $name, email: $email, password: $password, cnpj: $cnpj, contato:$contato, descricao:$descricao, genero: $genero, logradouro: $logradouro, complemento: $complemento, numero: $numero, cidade: $cidade, estado: $estado)";
}
