import 'package:flutter/material.dart';
import 'package:jackson_coffee/screens/thanks_screen.dart';

import '../services/inventory.dart';


class BasketPage extends StatelessWidget {
  final Inventory inventory;

  BasketPage(this.inventory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      body: ListView.builder(
        itemCount: inventory.items.length,
        itemBuilder: (context, index) {
          final itemName = inventory.items.keys.toList()[index];
          final quantity = inventory.items.values.toList()[index]['amount']!;
          final price = inventory.items.values.toList()[index]['price']!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                title: Text('$itemName (Quantity: $quantity)'),
                subtitle: Text('Price: \$$price'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
          ),
          onPressed: () {
            // Redirect to the "Thanks" screen when the "Pay" button is pressed.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThanksScreen(),
              ),
            );
          },
          child: Text(
            'Pay \$${inventory.getTotalPrice()}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


