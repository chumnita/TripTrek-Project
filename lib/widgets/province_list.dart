import 'package:flutter/material.dart';

class ProvinceList extends StatelessWidget {
  final List<Map<String, String>> provinces;
  const ProvinceList({super.key, required this.provinces});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // enough space for image + name
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: provinces.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final province = provinces[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0), // ✅ Rounded corners
                child: Image.asset(
                  province['img']!,
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                province['name']!,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
