import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: 'explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_rounded),
          label: 'favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile',
        ),
      ],
    );
  }
}
