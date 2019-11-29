class Usuario {
  int id;
  String nome;
  String foto;
  String email;
  String senha;
  String sexo;
  String dataNascimento;
  bool situacao;

  Usuario(
      {this.id,
      this.nome,
      this.foto,
      this.email,
      this.senha,
      this.sexo,
      this.dataNascimento,
      this.situacao});

   Usuario.fromJson(Map json) {
    id = json['id'];
    nome = json['nome'];
    foto = json['foto'];
    email = json['email'];
    senha = json['senha'];
    sexo = json['sexo'];
    dataNascimento = json['data_nascimento'];
    situacao = json['situacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['foto'] = this.foto;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['sexo'] = this.sexo;
    data['data_nascimento'] = this.dataNascimento;
    data['situacao'] = this.situacao;
    return data;
  }
}