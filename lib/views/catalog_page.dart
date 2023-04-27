import 'package:flutter/material.dart';
import 'package:storeapp/const_colors.dart';
import 'package:storeapp/model/category_card_model.dart';
import 'package:storeapp/widgets/category_card.dart';

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
  List<CategoryCardModel>? _categoryCardModelListOf;
  CategoryCardModel? _selectedCardModel;

  @override
  void initState() {
    super.initState();
    setState(() {
      _categoryCardModelListOf = List.of(categoryCardModelList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                  categoryCardName: categoryCardModel.categoryCardModelName,
                  isSelected: _selectedCardModel == categoryCardModel,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
