class Story {
  final String id;
  final String title;
  final List<String> imageUrls;
  final DateTime createdAt;
  final bool isViewed;

  Story({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.createdAt,
    this.isViewed = false,
  });
}

class SavedPlace {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final bool isSaved;

  SavedPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    this.isSaved = false,
  });
}
