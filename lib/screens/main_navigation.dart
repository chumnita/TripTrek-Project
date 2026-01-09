import 'package:flutter/material.dart';
import 'package:triptrek/screens/s2-home/home.dart';
import 'package:triptrek/screens/s3-journal/journal.dart';
import 'package:triptrek/screens/s4-budget/budgets.dart';
import 'package:triptrek/screens/s5-profile/profile.dart';
import 'package:triptrek/widgets/navbar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const JournalScreen(),
    const BudgetScreen(),
    const JournalProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

/* Remove this class definition if you have an actual ProfileScreen widget imported from 'package:triptrek/screens/s5-profile/profile.dart'; */
