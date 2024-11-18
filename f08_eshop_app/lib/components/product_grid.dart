import 'package:f08_eshop_app/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../model/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool _showOnlyFavoritos;
  ProductGrid(this._showOnlyFavoritos);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    
    //tras os prdutos gravados no firebase
    late Future<List<Product>> _products = provider.fetchProducts();

    return FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),); // Exibe um indicador de progresso enquanto os produtos estão sendo carregados
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vixe... algum erro aconteceu ao acessar a loja!",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                ],
              ),
            );
          } else if(snapshot.hasData) {
            // Se os produtos foram carregados com sucesso, você pode acessá-los aqui
            List<Product> products = snapshot.data!;
            return ProductGridView(products: products);
          } else {
            return Text("Nenhum produto cadastrado na loja!",);
          }
        });
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      //# ProductItem vai receber a partir do Provider
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (ctx) => Product.fromProduct(products[i]),
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //2 produtos por linha
        childAspectRatio: 3 / 2, //diemnsao de cada elemento
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
