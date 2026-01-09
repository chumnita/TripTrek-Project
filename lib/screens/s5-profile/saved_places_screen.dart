import 'package:flutter/material.dart';
import 'package:triptrek/widgets/story_model.dart';

class SavedPlacesScreen extends StatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  State<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  List<SavedPlace> savedPlaces = [
    SavedPlace(
      id: '1',
      name: 'Angkor Wat',
      description:
          "That is the most popular place we're highly recommend to your for visit it, enjoy and be chill with your love here.",
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/d/d4/20171126_Angkor_Wat_4712_DxO.jpg',
      rating: 5.0,
      isSaved: true,
    ),
    SavedPlace(
      id: '2',
      name: 'Preah Vihea',
      description:
          "That is the most popular place we're highly recommend to your for visit it, enjoy and be chill with your love here.",
      imageUrl:
          'https://www.khmertimeskh.com/wp-content/uploads/2023/12/Preah-Vihear-temple-1.jpg',
      rating: 5.0,
      isSaved: true,
    ),
    SavedPlace(
      id: '3',
      name: 'Koh Rong',
      description:
          "That is the most popular place we're highly recommend to your for visit it, enjoy and be chill with your love here.",
      imageUrl:
          'https://mediaim.expedia.com/destination/1/18b772d28e7377a8615a236584b32f90.jpg',
      rating: 5.0,
      isSaved: true,
    ),
  ];

  void _toggleSave(int index) {
    setState(() {
      savedPlaces[index] = SavedPlace(
        id: savedPlaces[index].id,
        name: savedPlaces[index].name,
        description: savedPlaces[index].description,
        imageUrl: savedPlaces[index].imageUrl,
        rating: savedPlaces[index].rating,
        isSaved: !savedPlaces[index].isSaved,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Saved Places',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedPlaces.length,
        itemBuilder: (context, index) {
          final place = savedPlaces[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Place Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      place.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: const Icon(Icons.image, color: Colors.grey),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Place Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          place.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              Icons.star,
                              size: 14,
                              color:
                                  starIndex < place.rating
                                      ? Colors.amber
                                      : Colors.grey[300],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  // Save Button
                  IconButton(
                    onPressed: () => _toggleSave(index),
                    icon: Icon(
                      place.isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color:
                          place.isSaved ? const Color(0xFF00BCD4) : Colors.grey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
