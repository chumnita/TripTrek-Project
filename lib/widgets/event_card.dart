import 'package:flutter/material.dart';
class EventCard extends StatelessWidget {
  final Map<String, String> event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Event image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              event['img']!,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.grey, size: 10),
                    SizedBox(width: 4),
                    Text(
                      'Phnom Penh, Cambodia',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.star_border, color: Colors.grey, size: 18),
                  ],
                ),
                const SizedBox(height: 9),
                Text(
                  event['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  event['date']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  event['desc']!,
                  style: const TextStyle(fontSize: 9, color: Colors.black87),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}