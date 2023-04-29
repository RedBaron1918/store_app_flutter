import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeapp/model/product_model.dart';

const String cacheKey = 'product_list';

ProductList? productListResponse;

class Services {
  static Future<ProductList> fetchProductData(String productUrl) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(cacheKey)) {
      final cache = jsonDecode(prefs.getString(cacheKey)!);
      final expiresAt = DateTime.parse(cache['expiresAt']);
      if (expiresAt.isAfter(DateTime.now())) {
        productListResponse =
            ProductList.fromJson(jsonDecode(cache['productList'])[0]);

        return productListResponse!;
      }
    }

    final response = await http.get(Uri.parse(productUrl));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      final productList = ProductList.fromJson(decodedResponse);
      prefs.setString(
          cacheKey,
          jsonEncode({
            'expiresAt':
                DateTime.now().add(const Duration(hours: 1)).toString(),
            'productList': response.body
          }));
      productListResponse = productList;
      return productList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<ProductList> futureData = Future<ProductList>(
      () => Services.fetchProductData("https://dummyjson.com/products"));
}
