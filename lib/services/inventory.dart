class Inventory {
  Map<String, Map<String, dynamic>> items = {};

  void addItem(String itemName, int quantity, double price) {
    if (items.containsKey(itemName)) {
      items[itemName]!.update("amount", (value) => value! + quantity);
    } else {
      items[itemName] = {
        'price': price,
        'amount': quantity,
      };
    }
  }

  void removeItem(String itemName, int quantity) {
    if (items.containsKey(itemName)) {
      if (items[itemName]!['amount']! <= quantity) {
        items.remove(itemName);
      }
      items[itemName]!.update("amount", (value) => value! - quantity);
    }
  }

  void clear() {
    items.clear();
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in items.values) {
      total += item['price']! * item['amount']!;
    }
    return total;
  }
}