import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';

class FutureWidget extends StatelessWidget {
  const FutureWidget({
    Key? key,
    required this.futureData,
    required this.builder,
  }) : super(key: key);

  final Future<ProductList> futureData;
  final Widget Function(AsyncSnapshot<ProductList>) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (context, AsyncSnapshot<ProductList> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return const Align(child: CircularProgressIndicator());
        }

        return builder(snapshot);
      },
    );
  }
}
