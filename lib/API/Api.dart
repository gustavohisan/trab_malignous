import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:trab_malignous/Model/Postagem.dart';
import 'package:trab_malignous/Model/Topicos.dart';


  Uri url = Uri.parse('http://192.168.0.14:3000');

    Future<List<Postagem>>getPostagens() async {
    Response response = await Dio().request(
        url.toString() + '/Publicacoes',
        options:
            Options(headers: {"Accept": "application/json"}, method: 'GET'));
        List<Postagem> postagens = List<Postagem>();
        for(Map<String, dynamic> item in response.data) {
          postagens.add(Postagem.fromJson(item));
        }

    return postagens;
  }

    Future<List<Topicos>> getTopicos() async {
    Response response = await Dio().request(
        url.toString() + '/Topicos',
        options:
            Options(headers: {"Accept": "application/json"}, method: 'GET'));
        List<Topicos> topicos = List<Topicos>();
        for(Map<String, dynamic> item in response.data) {
          topicos.add(Topicos.fromJson(item));
        }
    return topicos;
  }
  
    Future<Postagem>getPostagemID(int id) async {
    Response response = await Dio().request(
        url.toString() + '/PublicacaoPorId/' + id.toString(),
        options:
        Options(headers: {"Accept": "application/json"}, method: 'GET'));
        Postagem postagem = Postagem.fromJson(response.data[0]);
    return postagem;
  }
    
    postTexto(String titulo, String corpoDaPublicacao, String tituloTopico, int idDoUsuario) async {
        Response response = await Dio().request(
        url.toString() + '/idDoTopicoPorNome/' + tituloTopico,
        options:
        Options(headers: {"Accept": "application/json"}, method: 'GET'));
        Topicos topico = Topicos.fromJson(response.data[0]);

        var postagem = new Postagem(corpo: corpoDaPublicacao, situacao: true, tipo: "texto", tituloPublicacao: titulo, idUsuario: idDoUsuario, idTopico: topico.id,).toJson();
        print(postagem.toString());
        Response post = await Dio().request(
        url.toString() + '/CriarNovaPublicacao',
        options: 
        Options(headers: {"Accept": "application/json"}, method: 'POST'),
        data: postagem, 
        );

        print(postagem.toString());
        print(post.data.toString());
  }
