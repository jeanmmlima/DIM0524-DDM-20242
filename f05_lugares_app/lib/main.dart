
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:f05_lugares_app/screens/pais_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MeuApp()
  );
    
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => MinhasAbasBottom(),
      '/lugaresPais' : (context) => LugarPorPaisScreen(),
      '/detalheLugar' : (context) => DetalhesLugarScreen()
    },
  );
  }
}