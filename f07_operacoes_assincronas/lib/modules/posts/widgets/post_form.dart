import 'package:f07_operacoes_assincronas/modules/posts/repository/post_repository.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class PostForm extends StatelessWidget {
 PostForm({super.key, required this.postRepository });


  final PostRepository postRepository; 

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final teste = "dasda";

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Cadastrar Novo Post", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              TextFormField(
            decoration: InputDecoration(
              hintText: "Inserir o título",

            ),
            controller: _tituloController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o título';
              }
              return null;
            },
          ),
          SizedBox(height: 16,),
          TextFormField(
             decoration: InputDecoration(
              hintText: "Inserir o título",
              
            ),
            controller: _descricaoController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira a descrição';
              }
              return null;
            },
          ),
          SizedBox(height: 16,),
          ElevatedButton(
              //como tem o uso do await precisa ser async
              onPressed: () async {
                //validate retorna verdadeiro se o form foi devidamente preenchido
                if (_formKey.currentState!.validate()) {

                  final titulo = _tituloController.text;
                  final descricao = _descricaoController.text;

                  //espera a resposta para seguir para a próxima linha de código
                  final Post novoPost = await postRepository.cadastrarPost(titulo, descricao);

                  final _mySnackBar = SnackBar(content: Text("Post ${novoPost.id} cadastrado com sucesso!", style: TextStyle(fontSize: 20),));

                  ScaffoldMessenger.of(context).showSnackBar(
                    _mySnackBar,
                  );

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Cadastrar post'),
            ),
            ],
          ),
        ),
        ),
    );
  }
}