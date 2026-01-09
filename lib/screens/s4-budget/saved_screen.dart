import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> savedPlaces = [
      {
        'title': 'Angkor Wat',
        'image': 'assets/images/r1.jpg',
        'desc':
            'That is the most popular place we\'re highly recommend to your for visit it, enjoy and be chill with your love here.',
        'rating': 5.0,
      },
      {
        'title': 'Preah Vihea',
        'image': 'assets/images/r2.jpg',
        'desc':
            'That is the most popular place we\'re highly recommend to your for visit it, enjoy and be chill with your love here.',
        'rating': 4.5,
      },
      {
        'title': 'Bayon Temple',
        'image': 'assets/images/journal3.png',
        'desc':
            'That is the most popular place we\'re highly recommend to your for visit it, enjoy and be chill with your love here.',
        'rating': 5.0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.grid_view_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: savedPlaces.length,
        itemBuilder: (context, index) {
          final place = savedPlaces[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    place['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        place['desc'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: List.generate(5, (i) {
                          final rating = place['rating'] as double;
                          return Icon(
                            i < rating ? Icons.star : Icons.star_border,
                            size: 16,
                            color: Colors.amber,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.bookmark_outline, color: Color(0xFF4ECDC4)),
              ],
            ),
          );
        },
      ),
    );
  }
}
