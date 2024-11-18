import 'package:f07_operacoes_assincronas/modules/posts/repository/post_repository.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class PostForm extends StatelessWidget {
 PostForm({super.key, required this.postRepository, this.post});


  final PostRepository postRepository; 

  Post? post;

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(post != null){
      _tituloController.text = post!.title!;
      _descricaoController.text = post!.body!;
    }


    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              post != null
              ? Text("Editar Post", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
              : Text("Cadastrar Novo Post", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              post != null 
              ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Id: ${post!.id!}"),
                ],
              )
              : SizedBox(height: 0, width: 0,) ,
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

                  if(this.post == null){
                    //espera a resposta para seguir para a próxima linha de código
                  final Post novoPost = await postRepository.cadastrarPost(titulo, descricao);
                  final _mySnackBar = SnackBar(content: Text("Post ${novoPost.id} cadastrado com sucesso!", style: TextStyle(fontSize: 20),));
                  ScaffoldMessenger.of(context).showSnackBar(
                    _mySnackBar,
                  );
                  } else {
                    //espera a resposta para seguir para a próxima linha de código
                  final Post postEditado = await postRepository.editarPost(this.post!);
                  final _mySnackBar = SnackBar(content: Text("Post ${postEditado.id} editado com sucesso!", style: TextStyle(fontSize: 20),));
                  ScaffoldMessenger.of(context).showSnackBar(
                    _mySnackBar,
                  );
                  }
                  Navigator.of(context).pop();
                }
              },
              child: 
              post != null
              ? const Text('Editar post')
              : const Text('Cadastrar post'),
            ),
            ],
          ),
        ),
        ),
    );
  }
}