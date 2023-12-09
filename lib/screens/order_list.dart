import 'package:flutter/material.dart';
import 'dart:math';

import '../services/inventory.dart';
import '../types/coffee.dart';


class CoffeeTypeListItem extends StatefulWidget {
  final CoffeeType coffeeType;
  final Function(int) onItemCountChanged;
  final VoidCallback onAddToBasket;
  final Inventory inventory;

  CoffeeTypeListItem({
    required this.coffeeType,
    required this.onItemCountChanged,
    required this.onAddToBasket,
    required this.inventory,
  });

  final List<String> emojis = ['☕', '🍵', '🍩', '🍰', '🍪', '🥤', '🥐', '🍨'];

  @override
  _CoffeeTypeListItemState createState() => _CoffeeTypeListItemState();
}

class _CoffeeTypeListItemState extends State<CoffeeTypeListItem> {
  int itemCount = 0; // Default item count
  String emoji = '';

  @override
  void initState() {
    super.initState();
    // Get a random emoji from the list
    final random = Random();
    final randomIndex = random.nextInt(widget.emojis.length);
    emoji = widget.emojis[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for roundness
      ),
      child: ListTile(
        title: Row(
          children: [
            Text(widget.coffeeType.name),
            const SizedBox(width: 8), // Add spacing between text and emoji
            Text(emoji),
          ],
        ),
        subtitle: Text('\$${widget.coffeeType.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (itemCount > 0) {
                  setState(() {
                    itemCount--;
                    widget.onItemCountChanged(itemCount);
                  });
                  if (widget.inventory.items.containsKey(widget.coffeeType.name)) {
                    widget.inventory.removeItem(widget.coffeeType.name, 1);
                  }
                }
              },
            ),
            Text(itemCount.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  itemCount++;
                  widget.onItemCountChanged(itemCount);
                });
                widget.inventory.addItem(widget.coffeeType.name, 1, widget.coffeeType.price);
              },
            ),
          ],
        ),
      ),
    );
  }
}