import 'dart:convert';

import 'package:f07_operacoes_assincronas/modules/posts/model/post.dart';
import 'package:f07_operacoes_assincronas/shared/api_info.dart';

import 'package:http/http.dart' as http;

class PostRepository {
  final String postUri = jsonPlaceHolderUri.toString() + "/posts";

  //listar todos os posts
  Future<List<Post>> fetchPosts() async {
    //faz a requisição a json placeholder e espera a resposta chegar
    var resposta = await http.get(Uri.parse(postUri));
    if (resposta.statusCode == 200) {
      //converte resposta do body para lista
      List<dynamic> postsJson = jsonDecode(resposta.body);
      //itera a lista retorna posts
      return postsJson.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception("Falha ao carregar posts");
    }
  }

  //cadastrar novo post

  Future<Post> cadastrarPost(String titulo, String descricao) async {
    Map<String, dynamic> postData = {
      'title': titulo,
      'body': descricao,
      'userId': 1,
    };

    var resposta = await http.post(
      Uri.parse(postUri),
      body: jsonEncode(postData),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (resposta.statusCode == 201) {
      Map<String, dynamic> dadosNovoPost = jsonDecode(resposta.body);
      Post novoPost = Post.fromJson(dadosNovoPost);
      return novoPost;
    } else {
      throw Exception("Falha ao cadastrar novo posts");
    }
  }

  //editar post

  Future<Post> editarPost(Post post) async {

    Map<String, dynamic> postData = {
      'title': post.title,
      'body': post.body,
      'userId': post.userId,
    };

    final String uriEditPost = postUri + "/${post.id.toString()}";

    var resposta = await http.put(
      Uri.parse(uriEditPost),
      body: jsonEncode(postData),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (resposta.statusCode == 200) {
      Map<String, dynamic> dadosNovoPost = jsonDecode(resposta.body);
      Post novoPost = Post.fromJson(dadosNovoPost);
      return novoPost;
    } else {
      throw Exception("Falha ao editar post");
    }
  }

  //remover post

  Future<String> removerPost(int idPost) async {

    final String uriDeletePost = postUri + "/${idPost.toString()}";

    var resposta = await http.delete(
      Uri.parse(uriDeletePost),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (resposta.statusCode == 200) {
      return "Post ${idPost} removido com sucesso!";
    } else {
      throw Exception("Falha ao remover novo posts");
    }
  }



}
