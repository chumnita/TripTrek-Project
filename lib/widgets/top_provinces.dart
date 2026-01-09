import 'package:flutter/material.dart';

class TopProvinces extends StatelessWidget {
  final List<Map<String, String>> images;
  const TopProvinces({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          images
              .map(
                (province) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            province['img']!,
                            fit: BoxFit.cover,
                            height: 140,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          province['name']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
