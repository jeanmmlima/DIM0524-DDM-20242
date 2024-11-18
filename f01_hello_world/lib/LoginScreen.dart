
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha tela de login"),
          backgroundColor: ThemeData().primaryColor,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.rocket_launch,
                    size: 80,
                    color: ThemeData().primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Usuário"),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Inserir Usuário",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Senha",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Inserir Senha",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool) {},
                      ),
                      Text(
                        "Keep it",
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Esqueceu sua senha?"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () { print("clicou!");},
                  child: Text("Entrar"),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){ print ("clicou ");},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                    decoration: BoxDecoration(
                      color: ThemeData().primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Entrar", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
