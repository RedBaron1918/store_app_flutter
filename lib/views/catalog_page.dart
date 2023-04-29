import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/category_card_model.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/utils/services.dart';
import 'package:storeapp/widgets/cards/card_widget.dart';
import 'package:storeapp/widgets/cards/category_card.dart';
import 'package:storeapp/widgets/fade_in_image_widget.dart';
import 'package:storeapp/widgets/future_widget.dart';
import 'package:storeapp/widgets/icons/circle_icon.dart';
import 'package:storeapp/widgets/list_widget.dart';
import 'package:storeapp/widgets/search_bar.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final categoryCardModelList = <CategoryCardModel>[
    CategoryCardModel("Smartphones"),
    CategoryCardModel("TV"),
    CategoryCardModel("Accesesories"),
    CategoryCardModel("jewerly"),
    CategoryCardModel("clothes")
  ];
  CategoryCardModel? _selectedCardModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      extendBody: true,
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 80.10,
              backgroundColor: ColorConstants.backgroundColor,
              flexibleSpace: SafeArea(
                child: Container(
                  color: ColorConstants.backgroundColor,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Catalog",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.titleColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryCardModelList.length,
                      itemBuilder: (context, index) {
                        final categoryCardModel = categoryCardModelList[index];
                        return CategoryCard(
                          wasPressed: () {
                            setState(() {
                              _selectedCardModel = categoryCardModel;
                            });
                          },
                          categoryCardName:
                              categoryCardModel.categoryCardModelName,
                          isSelected: _selectedCardModel == categoryCardModel,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Expanded(child: SearchBar()),
                      CircleIcon(icon: Icons.tune),
                    ],
                  ),
                  FutureWidget(
                    futureData: Services.futureData,
                    builder: (AsyncSnapshot<ProductList> snapshot) {
                      final products = snapshot.data?.products ?? [];
                      final firstList = products.take(10).toList();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.36,
                              child: ListWidget(
                                count: firstList.length,
                                productData: ProductList(products: firstList),
                                dir: Axis.horizontal,
                                builder: (context, product) {
                                  return CardWidget(product: product!);
                                },
                              ),
                            ),
                            const FadeInImageWidget(
                              photo:
                                  'https://i.ytimg.com/vi/c3xmfpugW-0/maxresdefault.jpg',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.33,
                              child: ListWidget(
                                count: firstList.length,
                                productData: ProductList(products: firstList),
                                dir: Axis.horizontal,
                                builder: (context, product) {
                                  return CardWidget(product: product!);
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
