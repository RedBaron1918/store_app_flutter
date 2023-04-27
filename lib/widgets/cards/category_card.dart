import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';

class CategoryCard extends StatelessWidget {
  final String? categoryCardName;
  final Function()? wasPressed;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.categoryCardName,
    this.wasPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: wasPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConstants.titleColor
                : const Color.fromRGBO(242, 243, 243, 100),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            categoryCardName ?? 'Todas',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : ColorConstants.titleColor),
          ),
        ),
      ),
    );
  }
}
