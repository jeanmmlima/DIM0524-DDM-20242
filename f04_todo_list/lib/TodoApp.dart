import 'dart:math';

import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tarefa> _listaTarefas = [
      Tarefa(
          id: Random().nextInt(9999).toString(),
          descricao: "Estudar",
          dataTarefa: DateTime.now()),
      Tarefa(
        id: Random().nextInt(9999).toString(),
        descricao: "Estudar",
        dataTarefa: DateTime.now(),
      )
    ];

    TextEditingController _descricaoController = TextEditingController();

    void _addTarefa(){
      final descricaoTarefa = _descricaoController.text;
      print(descricaoTarefa);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas Tarefas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Text(
                    "Descrição: ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _descricaoController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: _addTarefa,
                    child: Text("Adicionar", style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _listaTarefas.elementAt(index).descricao,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
