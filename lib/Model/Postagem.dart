class Postagem {
  int id;
  String data;
  String titulo;
  String corpo;
  bool situacao;
  int quantAvaliacoes;
  int idUsuario;
  int idTopico;
  String tipo;

  Postagem(
      {this.id,
      this.data,
      this.titulo,
      this.corpo,
      this.situacao,
      this.quantAvaliacoes,
      this.idUsuario,
      this.idTopico,
      this.tipo});

  Postagem.fromJson(Map json) {
    id = json['id'];
    data = json['data'];
    titulo = json['titulo'];
    corpo = json['corpo'];
    situacao = json['situacao'];
    quantAvaliacoes = json['quant_avaliacoes'];
    idUsuario = json['id_usuario'];
    idTopico = json['id_topico'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['titulo'] = this.titulo;
    data['corpo'] = this.corpo;
    data['situacao'] = this.situacao;
    data['quant_avaliacoes'] = this.quantAvaliacoes;
    data['id_usuario'] = this.idUsuario;
    data['id_topico'] = this.idTopico;
    data['tipo'] = this.tipo;
    return data;
  }
}