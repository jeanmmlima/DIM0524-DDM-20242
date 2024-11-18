import 'package:f06_carrinho_provider/contador_provider/contador_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeuContador extends StatelessWidget {
  const MeuContador({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text("Meu Contador Provider", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "O valor do contador é: ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Consumer<ContadorModel>(
                  builder: (context, contadorModel, child) {
                    return Text(
                    "${contadorModel.contador}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Contador WATCH: ${context.watch<ContadorModel>().contador}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                Text("Contador PROVIDER OF: ${Provider.of<ContadorModel>(context).contador}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: (){
                    context.read<ContadorModel>().incrementar();
                  },
                  child: Text(
                    "Contar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    //context.read<ContadorModel>().zerar();
                    Provider.of<ContadorModel>(context,listen: false).zerar();
                  },
                  child: Text(
                    "Zerar",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}