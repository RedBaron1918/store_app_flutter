import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        title: Text('CheckOutPage'),
      ),
    );
  }
}
