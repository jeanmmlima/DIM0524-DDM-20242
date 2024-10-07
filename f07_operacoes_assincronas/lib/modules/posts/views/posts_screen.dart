import 'package:f07_operacoes_assincronas/modules/posts/model/post.dart';
import 'package:f07_operacoes_assincronas/modules/posts/repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<List<Post>>? listaPosts;
  final PostRepository _postRepository = PostRepository();

  @override
  void initState() {
    super.initState();
    listaPosts = _postRepository.fetchPosts();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: ThemeData().primaryColor,
      ),
      body: Container(
        
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: listaPosts,
          builder: (context, posts) {
            if (posts.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (posts.hasError) {
              // Exibe uma mensagem de erro caso algo dê errado
              return Text(
                'Erro: ${posts.error}',
                style: TextStyle(fontSize: 20),
              );
            } else if (posts.hasData) {
              return ListView.builder(
                itemCount: posts.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("#${posts.data![index].id!} ${posts.data![index].title!}"),
                      subtitle: Text(posts.data![index].body!),
                      leading: Icon(Icons.find_in_page_rounded),
                    ),
                  );
                },
              );
            } else {
              return Text(
                'Nenhum dado disponível',
                style: TextStyle(fontSize: 20),
              );
            }
          },
        ),
      ),
    );
  }
}
