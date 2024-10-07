import 'package:flutter/material.dart';

class MeuContador extends StatefulWidget {
  const MeuContador({super.key});

  @override
  State<MeuContador> createState() => _MeuContadorState();
}

class _MeuContadorState extends State<MeuContador> {

  int _contador = 0;

  void _contar(){
    setState(() {
      _contador++;
    });
    
    print(_contador);
  }

  void _zerar(){
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Contador"),
        backgroundColor: ThemeData().primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Valor do contador", style: TextStyle(fontSize: 20),),
            Text("${_contador}", style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: _contar, child: Text("Contar",style: TextStyle(fontSize: 20),),),
            ElevatedButton(onPressed: _zerar, child: Text("Zerar",style: TextStyle(fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}