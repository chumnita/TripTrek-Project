import 'package:flutter/material.dart';

class Showcase extends StatelessWidget {
  final List<String> images;
  const Showcase({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children:
            images
                .map(
                  (img) => Expanded(child: Image.asset(img, fit: BoxFit.cover)),
                )
                .toList(),
      ),
    );
  }
}
