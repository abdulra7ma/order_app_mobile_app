import 'package:flutter/material.dart';
import 'order_screen.dart';

class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thanks for your purchase',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange, // Change the app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ), // A checkmark icon for a successful purchase
            SizedBox(height: 20),
            Text(
              'Your order has been placed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Redirect back to the order page.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoffeeOrderScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Change the button's background color
              ),
              child: Text(
                'Back to Order Page',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
