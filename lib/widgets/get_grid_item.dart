import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';

class GetGridItem extends StatelessWidget {
  const GetGridItem(
      {required this.viewType,
      required this.productData,
      required this.crossAxisCount,
      required this.builder,
      required this.count,
      super.key});
  final ProductList productData;
  final ViewType viewType;
  final int crossAxisCount;
  final Widget Function(BuildContext context, Product? product) builder;
  final int count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(2),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) {
        Product? product = productData.products?[index];
        return InkWell(
          onTap: () {},
          child: builder(context, product),
        );
      },
      itemCount: count,
    );
  }
}
