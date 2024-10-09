import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("ID: "),
              Text("Descrição: "),
              Text("Data: "),
            ],
          ),
        ),
      ),
    );
  }
}