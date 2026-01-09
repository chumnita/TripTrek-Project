import 'package:flutter/material.dart';
import 'package:triptrek/screens/main_navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _onExplorePressed(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/explore.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(
                0.5,
              ), // <-- This makes image appear dark
            ),
          ),
          // Content Overlay
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Flexible spacer to center content
                  const Spacer(flex: 2),

                  // Logo and Welcome Text Section
                  Column(
                    children: [
                      // Logo
                      Image.asset(
                        'assets/images/login-1.png',
                        height: 130,
                        color: Colors.white,
                      ),

                      const SizedBox(height: 5),

                      // Welcome Text
                      const Text(
                        'Welcome!!!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // Flexible spacer to push button to bottom
                  const Spacer(flex: 3),

                  // Button Section
                  Column(
                    children: [
                      // Let's Explore Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => _onExplorePressed(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF52BD94),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Let's Explore",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40), // Bottom spacing
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
