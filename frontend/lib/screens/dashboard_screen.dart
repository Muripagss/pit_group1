import 'package:flutter/material.dart';
import 'login_screen.dart'; // import your login screen here

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Ensure no white bg leaks
      body: Stack(
        children: [
          // Fullscreen background image
          Positioned.fill(
            child: Image.asset(
              'assets/bg2.png',
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content with scroll to prevent overflow
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row with logo and logout button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 70,
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout, color: Colors.green),
                          tooltip: 'Logout',
                          onPressed: () {
                            // Navigate back to LoginScreen, replacing current page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Heading
                  Center(
                    child: Text(
                      'TEMPERATURE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Water Temperature Card
                  _buildTemperatureCard(
                    icon: 'assets/watertemplogo.png',
                    label: 'Water Temperature',
                    value: '22°C',
                  ),

                  const SizedBox(height: 20),

                  // Air Temperature Card
                  _buildTemperatureCard(
                    icon: 'assets/airtemplogo.png',
                    label: 'Air Temperature',
                    value: '26°C',
                  ),

                  const SizedBox(height: 40), // Extra padding at bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureCard({required String icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[500],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(icon, width: 40),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 5),
                Text(value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
