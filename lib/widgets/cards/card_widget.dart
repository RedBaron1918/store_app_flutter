import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/views/detail_page.dart';
import 'package:storeapp/widgets/fade_in_image_widget.dart';
import 'package:storeapp/widgets/text_container.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              product: widget.product,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(widget.product?.thumbnail ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  widget.product?.title ?? '',
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text(widget.product?.price.toString() ?? '',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.product?.rating.toString() ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
