import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String location;
  final double price;
  final double rating;

  const PlaceDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.location,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Budget',
          style: TextStyle(color: Color(0xFF4ECDC4), fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF4ECDC4)),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: BackButton(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
              Text(location, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(description),
          const SizedBox(height: 6),
          Text(
            '\$$price',
            style: const TextStyle(color: Color(0xFF4ECDC4), fontWeight: FontWeight.bold),
          ),
          Row(
            children: List.generate(5, (i) {
              return Icon(
                i < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              );
            }),
          ),
          const SizedBox(height: 12),
          const Text('Related', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 1; i <= 3; i++)
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/r$i.jpg', height: 60, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 4),
                        const Text('Siem Reap', style: TextStyle(fontSize: 11, color: Colors.grey)),
                        const Text('4.5 ★', style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
