
import 'package:f06_carrinho_provider/model/item.dart';
import 'package:mobx/mobx.dart';

part 'carrinho.store.g.dart';
/*
é uma classe que utiliza o conceito de mixin (with) para combinar a classe _CartModelX 
com as funcionalidades geradas automaticamente pelo mobx_codegen através do arquivo _$CartModelX.
*/
class CarrinhoModelX = _CarrinhoModelX with _$CarrinhoModelX;

/*
_CartModelX é uma classe abstrata que implementa a lógica de um modelo de carrinho de compras.
Ela estende Store, que é uma marcação para classes gerenciadas pelo MobX.
 */

abstract class _CarrinhoModelX with  Store {

  @observable
  ObservableList<Item> _products = ObservableList<Item>();
 
  @computed
  List<Item> get products => _products;

  @computed
  int get totalPrice =>
      _products.fold(0, (total, itemCorrente) => total + itemCorrente.price);

  @action
  void add(Item item) {
    _products.add(item);
  }

  @action
  void remove(Item item) {
    _products.remove(item);
  }

  bool hasItem(Item item){
    return _products.contains(item);
  }
  
}