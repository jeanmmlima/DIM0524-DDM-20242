import 'dart:convert';

import 'package:f07_operacoes_assincronas/modules/posts/model/post.dart';
import 'package:f07_operacoes_assincronas/shared/api_info.dart';

import 'package:http/http.dart' as http;

class PostRepository {

  final String postUri = jsonPlaceHolderUri.toString() + "/posts";

  //listar todos os posts
  Future<List<Post>> fetchPosts() async {

      //faz a requisição a json placeholder e espera a resposta chegar
      

  }

  //cadastrar novo post

  //editar post

  //remover post

}