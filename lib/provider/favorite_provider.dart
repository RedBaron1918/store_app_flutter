import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeapp/model/product_model.dart';
import 'package:storeapp/utils/services.dart';

const String cacheKey = 'favoriteIds';

void saveFavorite(String productId) async {
  final prefs = await SharedPreferences.getInstance();

  final List<String> favorites = prefs.containsKey(cacheKey)
      ? prefs.getStringList(cacheKey) as List<String>
      : <String>[];

  favorites.contains(productId)
      ? favorites.remove(productId)
      : favorites.add(productId);

  prefs.setStringList(cacheKey, favorites);
}

Future<bool> isFavorite(Product product) async {
  return (await getFavorites()).contains(product);
}

Future<List<Product?>> getFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  final favorites = prefs.containsKey(cacheKey)
      ? prefs.getStringList(cacheKey) as List<String>
      : <String>[];
  return productListResponse!.products!
      .map((element) {
        if (favorites.contains(element.id.toString())) {
          return element;
        }
      })
      .toList()
      .where((element) => element != null)
      .toList();
}
