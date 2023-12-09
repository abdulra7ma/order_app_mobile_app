import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Coffee Order App',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset('lib/assets/coffee_logo.png', width: 150, height: 150), // Replace with your coffee logo
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the main screen when the button is pressed.
                Navigator.pushReplacementNamed(context, '/main');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, visualDensity: VisualDensity.adaptivePlatformDensity, // Change the button's background color
              ),
              child: const Text(
                'Start Ordering',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
