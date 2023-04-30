import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/provider/check_out_provider.dart'
    as check_out_provider;
import 'package:storeapp/widgets/icons/icon_text_widget_row.dart';

class ButtonProvider extends StatefulWidget {
  const ButtonProvider({
    required this.product,
    super.key,
  });
  final Product product;

  @override
  State<ButtonProvider> createState() => _ButtonProviderState();
}

class _ButtonProviderState extends State<ButtonProvider> {
  bool _isInCart = false;
  @override
  void initState() {
    super.initState();
    isInCart();
  }

  void isInCart() async {
    _isInCart = await check_out_provider.isCheckOut(widget.product);
    setState(() {});
  }

  void _toggleFavorite() async {
    check_out_provider.saveCheckOut(widget.product.id.toString());
    _isInCart = !_isInCart;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      height: 50,
      padding: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 255, 96, 96),
      onPressed: _toggleFavorite,
      child: IconTextWidgetRow(
          icon: Icons.shopping_cart_outlined,
          text: _isInCart ? "remove from cart" : "add to cart",
          align: MainAxisAlignment.center,
          textColor: Colors.white,
          color: Colors.white),
    );
  }
}
