class Postagem {
  int id;
  String data;
  String tituloPublicacao;
  String tituloTopico;
  String nomeUsuario;
  String corpo;
  bool situacao;
  int quantAvaliacoes;
  String tipo;
  int idUsuario;
  int idTopico;
  String fotoTopico;

  Postagem(
      {this.id,
      this.data,
      this.corpo,
      this.situacao,
      this.quantAvaliacoes,
      this.tipo,
      this.tituloPublicacao,
      this.nomeUsuario,
      this.tituloTopico,
      this.idUsuario,
      this.idTopico,
      this.fotoTopico});

  Postagem.fromJson(Map<String, dynamic> json) {
    id = json['IDPublicacao'];
    data = json['data'];
    tituloPublicacao = json['TituloPublicacao'];
    corpo = json['corpo'];
    situacao = json['situacao'];
    quantAvaliacoes = json['quant_avaliacoes'];
    tipo = json['tipo'];
    nomeUsuario = json['nome'];
    tituloTopico = json['TituloTopico'];
    idUsuario = json['id_usuario'];
    idTopico = json['id_topico'];
    fotoTopico = json['foto'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDPublicacao'] = this.id;
    data['data'] = this.data;
    data['tituloPublicacao'] = this.tituloPublicacao;
    data['corpo'] = this.corpo;
    data['situacao'] = this.situacao;
    data['quant_avaliacoes'] = this.quantAvaliacoes;
    data['tipo'] = this.tipo;
    data['idUsuario'] = this.idUsuario;
    data['idTopico'] = this.idTopico;
    data['TituloTopico'] = this.tituloTopico;
    data['nome'] = this.nomeUsuario;
    data['foto'] = this.fotoTopico;
    return data;
  }
}
