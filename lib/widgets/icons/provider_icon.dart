import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/provider/favorite_provider.dart' as favorite_provider;

class ProviderIcon extends StatefulWidget {
  const ProviderIcon({
    this.iconSize = 30,
    this.height = 40,
    this.width = 40,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.red,
    required this.room,
    super.key,
  });
  final Color? iconColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? iconSize;
  final Product room;

  @override
  State<ProviderIcon> createState() => _ProviderIconState();
}

class _ProviderIconState extends State<ProviderIcon> {
  bool _isFavorite = false;
  List<Product?> favorites = [];
  @override
  void initState() {
    super.initState();
    isFavorite();
  }

  void isFavorite() async {
    _isFavorite = await favorite_provider.isFavorite(widget.room);
    setState(() {});
  }

  void _toggleFavorite() async {
    favorite_provider.saveFavorite(widget.room.id!.toString());
    _isFavorite = !_isFavorite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: _isFavorite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border_outlined),
        iconSize: widget.iconSize,
        color: widget.iconColor,
        onPressed: _toggleFavorite,
      ),
    );
  }
}
