
class CoffeeType {
  final String name;
  final double price;
  final int max_amount;

  CoffeeType(this.name, this.price, this.max_amount);
}

class CoffeeOrderItem {
  final CoffeeType coffeeType;

  CoffeeOrderItem({required this.coffeeType});
}

