import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/widgets/cards/card_widget.dart';
import 'package:storeapp/widgets/fade_in_image_widget.dart';
import 'package:storeapp/widgets/future_widget.dart';
import 'package:storeapp/widgets/get_grid_item.dart';
import 'package:storeapp/widgets/cards/grid_card.dart';
import 'package:storeapp/widgets/icons/icon_text_widget.dart';
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
  ViewType _viewType = ViewType.list;
  bool isList = true;
  void changeLayout() {
    if (_viewType == ViewType.list) {
      _viewType = ViewType.grid;
      isList = false;
    } else {
      _viewType = ViewType.list;
      isList = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      extendBody: true,
      body: SafeArea(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBarWidget(
              leading: true,
              callback: () {
                changeLayout();
              },
              text: '',
              bgColor: ColorConstants.backgroundColor,
              txtColor: Colors.black,
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: FutureWidget(
                futureData: Services.futureData,
                builder: (AsyncSnapshot<ProductList> snapshot) {
                  final products = snapshot.data?.products ?? [];
                  final firstList = products.take(10).toList();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const FadeInImageWidget(
                          photo:
                              'https://i.ytimg.com/vi/c3xmfpugW-0/maxresdefault.jpg',
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
                        isList
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.33,
                                child: ListWidget(
                                  count: firstList.length,
                                  productData: ProductList(products: firstList),
                                  dir: Axis.horizontal,
                                  builder: (context, product) {
                                    return CardWidget(product: product!);
                                  },
                                ),
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height * 1,
                                child: GetGridItem(
                                    viewType: _viewType,
                                    productData:
                                        ProductList(products: firstList),
                                    crossAxisCount: 2,
                                    builder: (context, product) {
                                      return GridCard(productData: product!);
                                    },
                                    count: firstList.length),
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
