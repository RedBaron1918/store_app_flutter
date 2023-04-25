import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/widgets/card_widget.dart';
import 'package:storeapp/widgets/circle_icon.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
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
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 160,
                          child: Text(
                            'Pick best Hotels for you',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const IconTextWidget(
                          icon: Icons.location_on,
                          text: "Batumi",
                          iconSize: 12,
                          textSize: 14,
                          color: Colors.redAccent,
                          textColor: Colors.redAccent,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Expanded(child: SearchBar()),
                            CircleIcon(icon: Icons.tune),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const IconTextWidget(
                          icon: Icons.star,
                          text: "Popular",
                          color: Colors.red,
                        ),
                        // SizedBox(
                        //   height: 290,
                        //   child: ListWidget(
                        //     dir: Axis.horizontal,
                        //     builder: (context, room) {
                        //     },
                        //   ),
                        // ),
                        // const IconTextWidget(
                        //   color: Colors.red,
                        //   icon: Icons.star,
                        //   text: "Featured",
                        // ),
                        SizedBox(
                          height: 284,
                          child: ListWidget(
                            productData: snapshot.data ?? ProductList(),
                            dir: Axis.horizontal,
                            builder: (context, product) {
                              return CardWidget(product: product);
                            },
                          ),
                        ),
                        // const IconTextWidget(
                        //   color: Colors.redAccent,
                        //   icon: Icons.favorite,
                        //   text: "Visitors Choice",
                        // ),
                        // SizedBox(
                        //   height: 100,
                        //   child: ListWidget(
                        //     dir: Axis.horizontal,
                        //     hotelData: snapshot.data ?? HotelList(),
                        //     builder: (
                        //       context,
                        //       room,
                        //     ) {
                        //       return SmallCard(room: room);
                        //     },
                        //   ),
                        // )
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
