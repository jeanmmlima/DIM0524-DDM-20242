
import 'package:f06_carrinho_provider/data/catalogo.dart';
import 'package:f06_carrinho_provider/model/item.dart';
import 'package:flutter/material.dart';

class CarrinhoModel with ChangeNotifier {

  List<Item> _produtos = [];

  List<Item> get produtos => _produtos;

  void addProduto(Item item){
    _produtos.add(item);
    notifyListeners();
  }

  void removerProduto(Item item){
    _produtos.remove(item);
    notifyListeners();
  }

  bool temProduto(Item item){
    return _produtos.contains(item);
  }

  int get total => _produtos.map<int>((_item) => _item.price).toList().reduce((a,b) => a + b);

}