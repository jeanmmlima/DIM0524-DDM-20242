
import 'package:flutter/material.dart';
import 'package:f04_todo_list/routes/MyRoutes.dart';

void main(){
    runApp(MaterialApp.router(
      routerConfig: myRouter,
      theme: ThemeData(
        // Defina o estilo global de texto
        textTheme: TextTheme(

          bodySmall: TextStyle(fontSize: 16.0),  // Configura o tamanho da fonte para bodyText1
          bodyMedium: TextStyle(fontSize: 20.0),  // Configura o tamanho da fonte para bodyText2
          bodyLarge: TextStyle(fontSize: 24.0),
        ),
      ),
    ),
    );
}