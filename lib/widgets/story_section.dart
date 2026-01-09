import 'package:flutter/material.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final users = List.generate(
      8,
      (i) => 'https://randomuser.me/api/portraits/women/$i.jpg',
    );

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return CircleAvatar(
            radius: 32,
            backgroundColor: const Color.fromARGB(255, 9, 192, 174),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(users[index]),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    );
  }
}
