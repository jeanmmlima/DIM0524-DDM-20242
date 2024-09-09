import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatelessWidget {
  TaskDetail({
    super.key, 
    });

  final Tarefa _tarefa = Tarefa(id: "1111", descricao: "descricao", dataTarefa: DateTime.now());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: Text(
          "Detalhes da tarefa",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("ID: ${_tarefa.id}"),
              Text("Descrição: ${_tarefa.descricao}"),
              Text("Data: ${DateFormat('dd/MM/y').format(_tarefa.dataTarefa)}"),
              SizedBox(
                height: 16,
              ),
             
                DateTime.now().isBefore(_tarefa.dataTarefa)
                ? Text("Status: Tarefa no prazo", style: TextStyle(color: Colors.green),)
                : Text("Status: Tarefa fora do prazo", style: TextStyle(color: Colors.red),),
              SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Voltar",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
