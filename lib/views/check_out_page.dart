import 'package:flutter/material.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/provider/favorite_provider.dart';
import 'package:storeapp/views/detail_page.dart';
import 'package:storeapp/widgets/cards/card_widget.dart';
import 'package:storeapp/widgets/icons/circle_icon.dart';
import 'package:storeapp/widgets/search_bar.dart';
import 'package:storeapp/widgets/sliver_appbar_widget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  List<Product?> products = [];
  int sumOfPrice = 0;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    _getPrice();
  }

  void _loadFavorites() async {
    products = await getFavorites();
    _getPrice();
    setState(() {});
  }

  void _getPrice() {
    for (var e in products) {
      sumOfPrice += e!.price!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            leading: false,
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
                Text("$sumOfPrice")
              ],
            ),
          )
        ],
      ),
    );
  }
}
