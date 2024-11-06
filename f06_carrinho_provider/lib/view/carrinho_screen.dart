import 'package:f06_carrinho_provider/model/carrinho.store.dart';
import 'package:f06_carrinho_provider/model/carrinho_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CarrinhoScreen extends StatelessWidget {
  const CarrinhoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var itemNameStyle = Theme.of(context).textTheme.headlineSmall;

    final carrinhoX = Provider.of<CarrinhoModelX>(context);

    return Observer(builder: (context) => ListView.builder(
      itemCount: carrinhoX.products.length,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.done),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                carrinhoX.remove(carrinhoX.products.elementAt(index));
              },
            ),
            title: Text(
              "${carrinhoX.products.elementAt(index).nome}",
              style: itemNameStyle,
            ),
          ),

    ));
    

    /* return Consumer<CarrinhoModel>(
      builder: (context, carrinho, child) {
        return ListView.builder(
          itemCount: carrinho.produtos.length,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.done),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                carrinho.removerProduto(carrinho.produtos.elementAt(index));
              },
            ),
            title: Text(
              "${carrinho.produtos.elementAt(index).nome}",
              style: itemNameStyle,
            ),
          ),
      );
      },
    ); */
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 48);

    final carrinhoX = Provider.of<CarrinhoModelX>(context);    

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                    /* Consumer<CarrinhoModel>(builder: (context, carrinho, child) {
                      return Text('\$${carrinho.total}', style: hugeStyle);
                    })
                     */ 
            Observer(builder: (context) => Text('\$${carrinhoX.totalPrice}', style: hugeStyle),)        ,
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Função de compra não é suportada ainda.')));
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('COMPRAR'),
            ),
          ],
        ),
      ),
    );
  }
}