import 'package:flutter/material.dart';
import 'package:jackson_coffee/screens/order_screen.dart';
import 'package:jackson_coffee/screens/welcome_screen.dart';

void main() {
  runApp(const CoffeeOrderApp());
}

class CoffeeOrderApp extends StatelessWidget {
  const CoffeeOrderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/main": (context) => const CoffeeOrderScreen(),
      },
    );
  }
}
