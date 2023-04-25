import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeapp/model/product_model.dart';

class Services {
  static Future<ProductList> fetchHotelData(String productUrl) async {
    final response = await http.get(Uri.parse(productUrl));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      final productList = ProductList.fromJson(decodedResponse);
      return productList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<ProductList> futureData = Future<ProductList>(
      () => Services.fetchHotelData("https://dummyjson.com/products"));
}
