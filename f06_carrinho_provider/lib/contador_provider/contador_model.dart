
import 'package:flutter/material.dart';

class ContadorModel with ChangeNotifier{

  int _cotador = 0;

  int get contador => _cotador;

  void incrementar(){
    _cotador++;
    notifyListeners();
  }

  void zerar(){
    _cotador = 0;
    notifyListeners();
  }

}