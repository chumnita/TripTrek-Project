import 'package:flutter/material.dart';
import 'package:triptrek/screens/s2-home/place_detail_screen.dart';

class ExploreDetailsScreen extends StatelessWidget {
  const ExploreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;

    // 4 unique card data
    final List<Map<String, String>> cardData = [
      {
        'image': 'assets/images/ex-5.jpg',
        'title': 'Urban resort & Spa',
        'place': 'Pub Street',
      },
      {
        'image': 'assets/images/ex-6.jpg',
        'title': 'Golden Hotel',
        'place': 'Angkor Wat',
      },
      {
        'image': 'assets/images/ex-7.png',
        'title': 'Relax Villa',
        'place': 'Floating Village',
      },
      {
        'image': 'assets/images/ex-8.jpg',
        'title': 'Luxury Retreat',
        'place': 'Bayon Temple',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            // Header image and overlay
            Stack(
              children: [
                Image.asset(
                  'assets/images/d-1.jpg',
                  width: double.infinity,
                  height: width * 0.44,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: topPadding + 8,
                  left: 16,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "It’s time to",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: const Text(
                    "Adventure The\nWorld",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Generate 4 unique cards
            ...cardData.map(
              (card) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image with overlay and heart
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              card['image']!,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.6),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      card['place']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 11,
                                          color: Colors.white70,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "Siem Reap",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 10.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 8,
                              right: 8,
                              child: CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Right: title, description, price
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card['title']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF23C882),
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "this is the places that you should explore with it Hope you joy it if you stay in our resort",
                              style: TextStyle(fontSize: 10, height: 1.3),
                            ),
                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: "Price: ",
                                        style: TextStyle(fontSize: 10),
                                        children: [
                                          TextSpan(
                                            text: "15.00\$",
                                            style: TextStyle(
                                              color: Color(0xFF23C882),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: "Rating: ",
                                        style: TextStyle(fontSize: 10),
                                        children: [
                                          TextSpan(
                                            text: "4.5",
                                            style: TextStyle(
                                              color: Color(0xFF23C882),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => PlaceDetailScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF23C882),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 2,
                                    ),
                                    shape: const StadiumBorder(),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    "See More",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
