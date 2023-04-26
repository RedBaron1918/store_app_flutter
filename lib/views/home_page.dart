import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/widgets/card_widget.dart';
import 'package:storeapp/widgets/fade_in_image_widget.dart';
import 'package:storeapp/widgets/future_widget.dart';
import 'package:storeapp/widgets/icon_text_widget.dart';
import 'package:storeapp/widgets/list_widget.dart';
import 'package:storeapp/widgets/search_bar.dart';
import 'package:storeapp/widgets/sliver_appbar_widget.dart';

import '../utils/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      extendBody: true,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBarWidget(
              text: '',
              bgColor: ColorConstants.backgroundColor,
              txtColor: Colors.black,
            ),
            SliverToBoxAdapter(
              child: FutureWidget(
                futureData: Services.futureData,
                builder: (AsyncSnapshot<ProductList> snapshot) {
                  final products = snapshot.data?.products ?? [];
                  final firstList = products.take(10).toList();
                  // final secondList = products.skip(10).take(10).toList();
                  // final thirdList = products.skip(20).take(10).toList();
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const FadeInImageWidget(
                          photo:
                              'https://i.ytimg.com/vi/c3xmfpugW-0/maxresdefault.jpg',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Expanded(child: SearchBar()),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            IconTextWidget(
                              icon: Icons.star,
                              text: "Popular Items",
                              color: Colors.red,
                            ),
                            Text('View All')
                          ],
                        ),
                        SizedBox(
                          height: 284,
                          child: ListWidget(
                            count: firstList.length,
                            productData: ProductList(products: firstList),
                            dir: Axis.horizontal,
                            builder: (context, product) {
                              return CardWidget(product: product!);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 284,
                          child: ListWidget(
                            count: firstList.length,
                            productData: ProductList(products: firstList),
                            dir: Axis.horizontal,
                            builder: (context, product) {
                              return CardWidget(product: product!);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
