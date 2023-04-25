import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.productData,
    required this.builder,
    required this.dir,
  }) : super(key: key);

  final ProductList productData;
  final Widget Function(BuildContext context, Product? product) builder;
  final Axis dir;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: dir,
      itemCount: 20,
      itemBuilder: (context, index) {
        final roomId = productData.products?[index].id;
        final room = productData.products?[roomId!];
        return InkWell(
          onTap: () {},
          child: builder(context, room),
        );
      },
    );
  }
}
