import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/views/detail_page.dart';
import 'package:storeapp/widgets/cards/card_widget.dart';
import 'package:storeapp/widgets/fade_in_image_widget.dart';
import 'package:storeapp/widgets/future_widget.dart';
import 'package:storeapp/widgets/icons/icon_text_widget_row.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
            SliverAppBarWidget(
              leading: true,
              callback: () {
                changeLayout();
              },
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
                  final secondList = products.skip(10).take(10).toList();
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
                            IconTextWidgetRow(
                              icon: Icons.star,
                              text: "Popular Items",
                              color: Colors.red,
                            ),
                            Text('View All')
                          ],
                        ),
                        isList
                            ? ListLayout(data: firstList)
                            : GridLayout(viewType: _viewType, data: firstList),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            IconTextWidgetRow(
                              icon: Icons.star,
                              text: "Popular Items",
                              color: Colors.red,
                            ),
                            Text('View All')
                          ],
                        ),
                        isList
                            ? ListLayout(data: secondList)
                            : GridLayout(viewType: _viewType, data: secondList)
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

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required ViewType viewType,
    required this.data,
  }) : _viewType = viewType;

  final ViewType _viewType;
  final List<Product> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 1 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  product: data[index],
                ),
              ),
            );
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: CardWidget(product: data[index]),
          ),
        );
      },
    );
  }
}

class ListLayout extends StatelessWidget {
  const ListLayout({
    super.key,
    required this.data,
  });

  final List<Product> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.36,
      child: ListWidget(
        count: data.length,
        productData: ProductList(products: data),
        dir: Axis.horizontal,
        builder: (context, product) {
          return CardWidget(product: product!);
        },
      ),
    );
  }
}
