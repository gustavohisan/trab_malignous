class Postagem {
  int id;
  String data;
  String titulo;
  String corpo;
  bool situacao;
  int quantAvaliacoes;
  String tipo;
  int idUsuario;
  int idTopico;

  Postagem(
      {this.id,
      this.data,
      this.titulo,
      this.corpo,
      this.situacao,
      this.quantAvaliacoes,
      this.tipo,
      this.idUsuario,
      this.idTopico});

  Postagem.fromJson(Map json) {
    id = json['id'];
    data = json['data'];
    titulo = json['titulo'];
    corpo = json['corpo'];
    situacao = json['situacao'];
    quantAvaliacoes = json['quant_avaliacoes'];
    tipo = json['tipo'];
    idUsuario = json['id_usuario'];
    idTopico = json['id_topico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['titulo'] = this.titulo;
    data['corpo'] = this.corpo;
    data['situacao'] = this.situacao;
    data['quant_avaliacoes'] = this.quantAvaliacoes;
    data['tipo'] = this.tipo;
    data['id_usuario'] = this.idUsuario;
    data['id_topico'] = this.idTopico;
    return data;
  }
}
