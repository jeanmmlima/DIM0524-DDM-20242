import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/routes/app_routes.dart';
import 'package:f05_lugares_app/routes/rotas.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  final List<Lugar> _lugaresFavoritos = [];

  void toggleLugarFavorito(Lugar place) {
    setState(() {
      _lugaresFavoritos.contains(place)
          ? _lugaresFavoritos.remove(place)
          : _lugaresFavoritos.add(place);
    });
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (ctx) => MinhasAbas(listaFavoritos: _lugaresFavoritos,),
        AppRoutes.COUNTRY_PLACES: (ctx) => LugarPorPaisScreen(),
        AppRoutes.PLACES_DETAIL: (ctx) => DetalhesLugarScreen(onToggle: toggleLugarFavorito),
        AppRoutes.SETTINGS: (ctx) => ConfigracoesScreen(),
      },
    );

    /* return MaterialApp.router(
      routerConfig: minhasRotas.getRouter(),
    ); */
  }
}
