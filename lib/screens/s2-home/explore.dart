import 'package:flutter/material.dart';
import 'explore_detail.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Let's find cool place !",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Box
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Where to?',
                hintStyle: TextStyle(color: Colors.black38),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.green),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Select your choice",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 12),

          // MAP + CHOICES
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MAP
              Container(
                width: screenWidth * 0.25,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/ex-m-1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: 9, color: Colors.black),
                        SizedBox(width: 6),
                        Text(
                          'Siem Reap',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // CHOICE ICONS
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOutlinedChoice(Icons.apartment, 'Hotel', context),
                    _buildOutlinedChoice(
                      Icons.restaurant,
                      'Restaurant',
                      context,
                    ),
                    _buildOutlinedChoice(
                      Icons.flight,
                      'Transportation',
                      context,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
          const Text(
            "Trips For You",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 25,
              mainAxisSpacing: 20,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              children: [
                _buildGridItem(
                  "Angkor Wat",
                  "Siem Reap",
                  "assets/images/ex-4.jpg",
                  context,
                ),
                _buildGridItem(
                  "Pub Street",
                  "Siem Reap",
                  "assets/images/ex-5.jpg",
                  context,
                ),
                _buildGridItem(
                  "Angkor Wat",
                  "Siem Reap",
                  "assets/images/ex-6.jpg",
                  context,
                ),
                _buildGridItem(
                  "Pub Street",
                  "Siem Reap",
                  "assets/images/ex-7.png",
                  context,
                ),
                _buildGridItem(
                  "Angkor Wat",
                  "Siem Reap",
                  "assets/images/ex-8.jpg",
                  context,
                ),
                _buildGridItem(
                  "Pub Street",
                  "Siem Reap",
                  "assets/images/ex-9.jpg",
                  context,
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Relate Destination",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "this is the province that relate with it",
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExploreDetailsScreen(),
                    ),
                  );
                },
                child: _buildProvinceCard(
                  "Sihanoukville",
                  "assets/images/ex-10.jpg",
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExploreDetailsScreen(),
                    ),
                  );
                },
                child: _buildProvinceCard(
                  "Sihanoukville",
                  "assets/images/ex-11.jpg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // CHOICE
  Widget _buildOutlinedChoice(
    IconData icon,
    String label,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ExploreDetailsScreen()),
          ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Center(child: Icon(icon, size: 30, color: Colors.black54)),
          ),
          const SizedBox(height: 7),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  // GRID ITEM
  Widget _buildGridItem(
    String place,
    String province,
    String imagePath,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ExploreDetailsScreen()),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 12,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          province,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
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
              child: Icon(Icons.favorite_border, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // PROVINCE CARD
  Widget _buildProvinceCard(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "this is the province that you should explore with it",
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
