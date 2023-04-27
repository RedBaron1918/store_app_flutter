import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';

class GridCard extends StatelessWidget {
  const GridCard({required this.productData, super.key});
  final Product productData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //add this
          children: <Widget>[
            Expanded(
              child: Image.network(
                productData.images![0],
                fit: BoxFit.cover, // add this
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text("Title under"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
