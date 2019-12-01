import 'package:dio/dio.dart';
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
      print(id);
    Response response = await Dio().request(
        url.toString() + '/PublicacaoPorId/' + id.toString(),
        options:
        Options(headers: {"Accept": "application/json"}, method: 'GET'));
        Postagem postagem = Postagem.fromJson(response.data[0]);
        print(postagem.toJson());
    return postagem;
  }
