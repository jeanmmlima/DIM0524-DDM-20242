import 'package:flutter/material.dart';

class Item {
  int id;
  String nome;
  Color cor;
  int price = 42;

  Item(this.id, this.nome)
      : cor = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
