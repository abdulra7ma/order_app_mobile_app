import 'package:flutter/material.dart';

import '../repos/coffee_repository.dart';
import '../services/inventory.dart';
import '../types/coffee.dart';
import 'basket_page.dart';
import 'order_list.dart';

class CoffeeOrderScreen extends StatefulWidget {
  const CoffeeOrderScreen({Key? key}) : super(key: key);

  @override
  _CoffeeOrderScreenState createState() => _CoffeeOrderScreenState();
}

class _CoffeeOrderScreenState extends State<CoffeeOrderScreen> {
  late Future<List<CoffeeType>> coffeeTypesFuture;
  List<CoffeeOrderItem> orderItems = [];
  final Inventory inventory = Inventory();

  @override
  void initState() {
    super.initState();
    coffeeTypesFuture = CoffeeRepository.getCoffeeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Order'),
      ),
      body: FutureBuilder<List<CoffeeType>>(
        future: coffeeTypesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Display a loader while fetching data
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Display an error message if fetching fails
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'), // Display a message if no data is returned
            );
          } else {
            List<CoffeeType> coffeeTypes = snapshot.data!;
            return ListView.builder(
              itemCount: coffeeTypes.length,
              itemBuilder: (context, index) {
                return CoffeeTypeListItem(
                  coffeeType: coffeeTypes[index],
                  onItemCountChanged: (count) {
                    // Handle item count change if needed
                  },
                  onAddToBasket: () {
                    setState(() {
                      orderItems.add(CoffeeOrderItem(
                        coffeeType: coffeeTypes[index],
                      ));
                    });
                  },
                  inventory: inventory,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BasketPage(inventory),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}