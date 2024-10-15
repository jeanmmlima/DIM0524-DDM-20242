import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';

class ItemPais extends StatelessWidget {
  ItemPais({super.key, required Pais pais}) : _pais = pais;

  final Pais _pais;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/lugaresPais', arguments: _pais),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            _pais.titulo,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [
                  _pais.cor.withOpacity(0.5), //cor passad com opacidade
                  _pais.cor, //cor passada
                ],
                begin: Alignment.topLeft, //inicio do gradiente
                end: Alignment.bottomRight // fim
                ),
          ),
        ),
      ),
    );
  }
}
