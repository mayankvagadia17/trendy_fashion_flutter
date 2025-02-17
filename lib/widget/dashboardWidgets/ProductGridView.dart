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
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productProvider.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.80,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: productProvider.productList[index]);
              },
            ),
          )
        : Container(
            height: 100,
            child: Center(
              child: Text(
                'No products available.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          );
  }
}
