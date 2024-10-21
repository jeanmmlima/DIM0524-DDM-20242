import 'package:f07_operacoes_assincronas/modules/posts/repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostDeleteDialog extends StatelessWidget {
  const PostDeleteDialog(
      {super.key, required this.postRepository, required this.postId});

  final PostRepository postRepository;
  final int postId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Deseja confirmar a exclusão do post?"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Não"),
        ),
        TextButton(
          onPressed: () async {
            final mensagem = await postRepository.removerPost(postId);

            final _mySnackBar = SnackBar(
                content: Text(
              "${mensagem}",
              style: TextStyle(fontSize: 20),
            ));

            ScaffoldMessenger.of(context).showSnackBar(
              _mySnackBar,
            );

            Navigator.of(context).pop();
          },
          child: Text("Sim"),
        ),
      ],
      elevation: 100,
      insetPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    );
  }
}
