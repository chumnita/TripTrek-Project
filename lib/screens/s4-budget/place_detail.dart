import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatefulWidget {
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
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  bool isFavorited = false;

  final List<Map<String, dynamic>> relatedPlaces = [
    {
      'image': 'assets/images/d1.png',
      'title': 'Bayon Temple',
      'location': 'Siem Reap',
      'rating': 5.0,
      'price': 149.99,
    },
    {
      'image': 'assets/images/d2.png',
      'title': 'Angkor Thom',
      'location': 'Siem Reap',
      'rating': 4.8,
      'price': 120.00,
    },
    {
      'image': 'assets/images/d3.png',
      'title': 'Ta Prohm',
      'location': 'Siem Reap',
      'rating': 4.5,
      'price': 135.00,
    },
    {
      'image': 'assets/images/d1.png',
      'title': 'Banteay Srei',
      'location': 'Siem Reap',
      'rating': 4.9,
      'price': 110.50,
    },
    {
      'image': 'assets/images/d2.png',
      'title': 'Preah Khan',
      'location': 'Siem Reap',
      'rating': 4.3,
      'price': 98.75,
    },
    {
      'image': 'assets/images/d3.png',
      'title': 'Neak Pean',
      'location': 'Siem Reap',
      'rating': 4.1,
      'price': 105.30,
    },
  ];

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
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() => isFavorited = !isFavorited);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(widget.location, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(widget.description, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Text(
            '\$${widget.price.toStringAsFixed(0)}',
            style: const TextStyle(
              color: Color(0xFF4ECDC4),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Row(
            children: List.generate(5, (i) {
              return Icon(
                i < widget.rating.round() ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              );
            }),
          ),
          const SizedBox(height: 20),
          const Text('Related', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: relatedPlaces.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final place = relatedPlaces[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      place['image'],
                      height: 80,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    place['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 12, color: Colors.grey),
                      Expanded(
                        child: Text(
                          place['location'],
                          style: const TextStyle(fontSize: 10, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 12, color: Colors.amber),
                      Text('(${place['rating']})',
                          style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic)),
                      const Spacer(),
                      Text(
                        '\$${place['price'].toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
