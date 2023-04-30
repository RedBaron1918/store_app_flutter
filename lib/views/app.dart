import 'package:flutter/material.dart';
import 'package:storeapp/views/catalog_page.dart';
import 'package:storeapp/views/favorige_page.dart';
import 'package:storeapp/views/home_page.dart';
import 'package:storeapp/views/profile_page.dart';
import 'package:storeapp/widgets/bottom_navigation_widget.dart';
import 'package:storeapp/widgets/scroll_to_hide_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;
  List<Widget> pageList = [
    const HomePage(),
    const CatalogPage(),
    const FavoritePage(),
    const ProfilePage()
  ];
  late final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        child: BottomNavigationWidget(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        slivers: [
          SliverFillRemaining(
            child: pageList.elementAt(currentIndex),
          )
        ],
      ),
    );
  }
}
