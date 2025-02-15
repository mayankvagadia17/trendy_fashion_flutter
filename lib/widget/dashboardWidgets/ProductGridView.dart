import 'package:flutter/material.dart';

import '../../provider/ProductProvider.dart';
import '../../screens/ProductCard.dart';

class ProductGridView extends StatelessWidget {
  final Productprovider productProvider;
  const ProductGridView({super.key, required this.productProvider});

  @override
  Widget build(BuildContext context) {
    return productProvider.productList.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productProvider.productList.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                  product: productProvider.productList[index]);
            },
          )
        )
        : const Center(child: Text('No products available.'));
  }
}
