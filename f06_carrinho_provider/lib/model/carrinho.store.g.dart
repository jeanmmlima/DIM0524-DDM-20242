// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarrinhoModelX on _CarrinhoModelX, Store {
  Computed<List<Item>>? _$productsComputed;

  @override
  List<Item> get products =>
      (_$productsComputed ??= Computed<List<Item>>(() => super.products,
              name: '_CarrinhoModelX.products'))
          .value;
  Computed<int>? _$totalPriceComputed;

  @override
  int get totalPrice =>
      (_$totalPriceComputed ??= Computed<int>(() => super.totalPrice,
              name: '_CarrinhoModelX.totalPrice'))
          .value;

  late final _$_productsAtom =
      Atom(name: '_CarrinhoModelX._products', context: context);

  @override
  ObservableList<Item> get _products {
    _$_productsAtom.reportRead();
    return super._products;
  }

  @override
  set _products(ObservableList<Item> value) {
    _$_productsAtom.reportWrite(value, super._products, () {
      super._products = value;
    });
  }

  late final _$_CarrinhoModelXActionController =
      ActionController(name: '_CarrinhoModelX', context: context);

  @override
  void add(Item item) {
    final _$actionInfo = _$_CarrinhoModelXActionController.startAction(
        name: '_CarrinhoModelX.add');
    try {
      return super.add(item);
    } finally {
      _$_CarrinhoModelXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Item item) {
    final _$actionInfo = _$_CarrinhoModelXActionController.startAction(
        name: '_CarrinhoModelX.remove');
    try {
      return super.remove(item);
    } finally {
      _$_CarrinhoModelXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
totalPrice: ${totalPrice}
    ''';
  }
}
