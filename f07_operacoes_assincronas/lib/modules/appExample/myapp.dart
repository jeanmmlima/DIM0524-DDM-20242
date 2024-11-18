import 'package:f07_operacoes_assincronas/api/test_repository.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String>? _futureData;
  TestRepository _testRepository = TestRepository();

  @override
  void initState() {
    super.initState();
    _futureData = _testRepository
        .fetchApiData(); // Chamando a função assíncrona no início do estado
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operações Assíncronas com Flutter'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FutureBuilder<String>(
            future: _futureData, // Future a ser aguardado
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Exibe um indicador de carregamento enquanto a operação não foi concluída
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Exibe uma mensagem de erro caso algo dê errado
                return Text('Erro: ${snapshot.error}',style: TextStyle(fontSize: 20),);
              } else if (snapshot.hasData) {
                // Exibe os dados quando o Future for concluído com sucesso
                return Text(snapshot.data!, style: TextStyle(fontSize: 20),);
              } else {
                return Text('Nenhum dado disponível',style: TextStyle(fontSize: 20),);
              }
            },
          ),
        ),
      ),
    );
  }
}