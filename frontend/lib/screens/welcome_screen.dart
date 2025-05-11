import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (optional)
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png', // Your wave background
              fit: BoxFit.cover,
            ),
          ),

          // Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'WELCOME!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                const SizedBox(height: 20),

                // Logo
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                ),
                const SizedBox(height: 20),

                // Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginSignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for login/signup screen
class LoginSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose")),
      body: const Center(child: Text("Login or Sign Up goes here")),
    );
  }
}
