import 'package:flutter/material.dart';
import 'package:triptrek/screens/s2-home/booking.dart';
// import 'package:triptrek/widgets/feedback_modal.dart'; // ✅ Import your modal

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  Widget _roundedImage(String path, double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(path, width: width, height: height, fit: BoxFit.cover),
    );
  }

  Widget _reviewTile({
    required String avatar,
    required String name,
    required String date,
    required String comment,
    required double rating,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: AssetImage(avatar), radius: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text('$rating', style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 10),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(comment, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder:
                (context) => const Center(
                  child: Text('Feedback Modal Placeholder'),
                ), // TODO: Replace with actual FeedbackModal widget
          );
        },
        child: const Icon(Icons.add, color: Colors.green),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 28),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 12),

              /// ✅ Header layout (Top): Left images, right info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _roundedImage('assets/images/resort1.jpg', 140, 140),
                      const SizedBox(height: 12),
                      _roundedImage('assets/images/resort2.jpg', 140, 140),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Urban resort & Spa',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'this is the places that you should explore with it\nHope you joy it if you stay in our resort',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Price: 15.00\$',
                          style: TextStyle(color: Colors.green),
                        ),
                        const Text(
                          'Rating  4.5',
                          style: TextStyle(color: Colors.teal),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF52BD94),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Book Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// ✅ Gallery layout (Bottom): 1 wide + 3 stacked
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: _roundedImage(
                      'assets/images/resort3.jpg',
                      double.infinity,
                      180,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _roundedImage(
                          'assets/images/resort4.jpg',
                          double.infinity,
                          55,
                        ),
                        const SizedBox(height: 6),
                        _roundedImage(
                          'assets/images/resort5.jpg',
                          double.infinity,
                          55,
                        ),
                        const SizedBox(height: 6),
                        _roundedImage(
                          'assets/images/resort6.jpg',
                          double.infinity,
                          55,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Tabs
              Row(
                children: const [
                  Text(
                    'Reviews',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Related',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Reviews
              _reviewTile(
                avatar: 'assets/images/p1.jpg',
                name: 'Jlanh Nas',
                date: '1 days ago',
                rating: 5.0,
                comment:
                    "This caption captures the essence of a fun and cozy pizza night. It's concise and evokes a warm, inviting atmosphere, emphasizing freshness and satisfaction.",
              ),
              _reviewTile(
                avatar: 'assets/images/p2.jpg',
                name: 'Jidi Dodo',
                date: '5 days ago',
                rating: 5.0,
                comment:
                    "This caption captures the essence of a fun and cozy pizza night. To enhance it, consider adding a playful element or a specific detail.",
              ),
              _reviewTile(
                avatar: 'assets/images/p3.jpg',
                name: 'Moso sas',
                date: '4 days ago',
                rating: 5.0,
                comment:
                    "Homemade pizza night! With fresh basil, zesty tomatoes, and gooey cheese — happy tummies all around!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
