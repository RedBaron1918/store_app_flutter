import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.productData,
    required this.builder,
    required this.dir,
    required this.count,
  }) : super(key: key);

  final ProductList productData;
  final int count;
  final Widget Function(BuildContext context, Product? product) builder;
  final Axis dir;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: dir,
      itemCount: count,
      itemBuilder: (context, index) {
        Product? product = productData.products?[index];
        return InkWell(
          onTap: () {},
          child: builder(context, product),
        );
      },
    );
  }
}
