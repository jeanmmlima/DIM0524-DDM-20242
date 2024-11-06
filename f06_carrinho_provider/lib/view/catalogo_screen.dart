import 'package:f06_carrinho_provider/data/catalogo.dart';
import 'package:f06_carrinho_provider/model/carrinho.store.dart';
import 'package:f06_carrinho_provider/model/carrinho_model.dart';
import 'package:f06_carrinho_provider/model/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalagoScreen extends StatelessWidget {
  CatalagoScreen({super.key});

  final List<Item> itens = catalogo.map<Item>((produto) => Item(catalogo.indexOf(produto), produto)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: itens.length,
                (context, index) => _MyListItem(itens.elementAt(index))),
          ),
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.yellow,
      title: Text('Catalogo', style: Theme.of(context).textTheme.headlineLarge),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Item item;

  const _MyListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var textTheme = Theme.of(context).textTheme.headlineSmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.cor,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.nome, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        //final carrinho = Provider.of<CarrinhoModel>(context);
        final carrinhoX = Provider.of<CarrinhoModelX>(context);

        return TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.pressed)) {
                return Theme.of(context).primaryColor;
              }
              return null;
            }),
          ),
          onPressed: () { 
            carrinhoX.add(item);
            },
            
          child: carrinhoX.hasItem(item) ? const Icon(Icons.check) : const Text('ADD'), 
        );

  }
}