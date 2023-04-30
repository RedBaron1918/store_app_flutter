import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/provider/check_out_provider.dart';
import 'package:storeapp/widgets/icons/circle_icon.dart';

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
    _loadCheckOutItems();
    _getPrice();
  }

  void _loadCheckOutItems() async {
    products = await getCheckOuts();
    _getPrice();
    setState(() {});
  }

  void _getPrice() {
    for (var e in products) {
      sumOfPrice += e!.price!;
    }
    setState(() {});
  }

  final String cacheKey = 'checkOutId';

  Future<void> deleteCheckout(String productId) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> checkOut = prefs.containsKey(cacheKey)
        ? prefs.getStringList(cacheKey) as List<String>
        : <String>[];

    checkOut.remove(productId);

    prefs.setStringList(cacheKey, checkOut);
    _loadCheckOutItems();
    _getPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorConstants.backgroundColor,
            leading: CircleIcon(
              icon: Icons.arrow_back,
              iconColor: Colors.black,
              callBack: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                products.isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Card(
                                child: ListTile(
                                  onTap: () {},
                                  leading: Image.network(
                                      products[index]?.thumbnail ?? ''),
                                  title: Text("${products[index]?.title}"),
                                  subtitle: Text("\$${products[index]?.price}"),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      deleteCheckout(
                                          products[index]!.id.toString());
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Text(
                          "cart is empty!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                Text("$sumOfPrice"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
