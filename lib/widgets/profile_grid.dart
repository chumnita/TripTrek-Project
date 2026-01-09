import 'package:flutter/material.dart';
import '/data/mock_data.dart';

class ProfileGrid extends StatelessWidget {
  const ProfileGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Highlight Stories Row
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: highlights.length,
            itemBuilder: (context, index) {
              final item = highlights[index];
              final isIcon = item['icon'] == true;

              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child:
                          isIcon
                              ? const Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.black,
                              )
                              : ClipOval(
                                child: Image.asset(
                                  item['img'] as String,
                                  fit: BoxFit.cover,
                                  width: 64,
                                  height: 64,
                                ),
                              ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label'] as String,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const Divider(),

        // Grid of Posts
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mockProfilePosts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemBuilder: (context, index) {
            final item = mockProfilePosts[index];

            return GestureDetector(
              onTap: () {
                // Optionally handle tap
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(item['img'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (item['label'] != null)
                    Positioned(
                      bottom: 4,
                      left: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 4,
                        ),
                        color: Colors.black54,
                        child: Text(
                          item['label'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
