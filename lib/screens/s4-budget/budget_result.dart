import 'package:flutter/material.dart';
import '../../widgets/place_card.dart';
import 'place_detail.dart';
import 'saved_screen.dart';

class BudgetResultScreen extends StatelessWidget {
  final String province;
  final String amount;

  const BudgetResultScreen({
    super.key,
    required this.province,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> places = [
      {
        'title': 'Angkor Wat',
        'image': 'assets/images/r1.jpg',
        'desc':
            'That is the most popular place we\'re highly recommend to your for visit it, enjoy and be chill with your love here.',
        'rating': 5.0,
        'location': 'Siem Reap',
        'price': 150.0,
      },
      {
        'title': 'Preah Vihea',
        'image': 'assets/images/r2.jpg',
        'desc':
            'That is the most popular place we\'re highly recommend to your for visit it, enjoy and be chill with your love here.',
        'rating': 4.5,
        'location': 'Preah Vihear',
        'price': 100.0,
      },
      {
        'title': 'Angkor Wat',
        'image': 'assets/images/r1.jpg',
        'desc':
            'That is the most popular place we\'re highly recommend to your for visit it, enjoy and be chill with your love here.',
        'rating': 5.0,
        'location': 'Siem Reap',
        'price': 150.0,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Budget',
          style: TextStyle(
            color: Color(0xFF4ECDC4),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF4ECDC4)),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SavedScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            children: [
              const Text(
                'Result',
                style: TextStyle(
                  color: Color(0xFF4ECDC4),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              ...places.map((place) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => PlaceDetailScreen(
                              title: place['title'],
                              imageUrl: place['image'],
                              description: place['desc'],
                              location: place['location'],
                              price: place['price'],
                              rating: place['rating'],
                            ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      PlaceCard(
                        imageUrl: place['image'],
                        title: place['title'],
                        description: place['desc'],
                        rating: (place['rating'] as num).toDouble(),
                      ),
                      const Positioned(
                        top: 12,
                        right: 12,
                        child: Icon(
                          Icons.bookmark_outline,
                          color: Color(0xFF4ECDC4),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'see more>>',
                    style: TextStyle(color: Color(0xFF4ECDC4), fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
