import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/provider/favorite_provider.dart';
import 'package:storeapp/views/detail_page.dart';
import 'package:storeapp/widgets/cards/card_widget.dart';
import 'package:storeapp/widgets/icons/circle_icon.dart';
import 'package:storeapp/widgets/search_bar.dart';
import 'package:storeapp/widgets/sliver_appbar_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Product?> products = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    products = await getFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            leading: true,
            text: "Favorites",
            bgColor: Colors.white,
            txtColor: Colors.black,
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Expanded(child: SearchBar()),
                      CircleIcon(icon: Icons.tune),
                    ],
                  ),
                ),
                products.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          childAspectRatio: 1 / 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: products.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    product: products[index]!,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: CardWidget(product: products[index]),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          "you have no Favorites yet!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
