import 'package:flutter/material.dart';

class Pais {
  final String id;
  final String titulo;
  final Color cor;

  const Pais({
    required this.id,
    required this.titulo,
    this.cor = Colors.blue,
  });
}