import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        title: const Text('CatalogPage'),
      ),
    );
  }
}
