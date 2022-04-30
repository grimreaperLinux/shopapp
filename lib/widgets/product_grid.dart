import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;

  ProductsGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final loadedProducts =
        showFav ? productsdata.favouriteItems : productsdata.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: productItem(
            // loadedProducts[i].id,
            // loadedProducts[i].imageUrl,
            // loadedProducts[i].title,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
