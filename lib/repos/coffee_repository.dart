import '../types/coffee.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class CoffeeRepository {
  static Future<List<CoffeeType>> getCoffeeTypes() {
    return Future.sync(() async {
      const apiUrl = 'http://10.0.2.2:8000/items/'; // Your API URL

      try {
        final response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);

          List<CoffeeType> coffeeTypes = data.map((item) {
            return CoffeeType(
              item['name'],
              double.parse(item['price']),
              int.parse(item['id'].toString()),
            );
          }).toList();

          return coffeeTypes;
        } else {
          // Handle error if the request fails
          throw Exception('Failed to load data');
        }
      } catch (e) {
        // Handle other exceptions (e.g., network errors)
        print(e);
        throw Exception('Error: $e');
      }
    });
  }
}