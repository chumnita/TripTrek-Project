import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profile.dart';
import 'profile_menu.dart';
import 'create_story_screen.dart';
import 'story_viewer_screen.dart';
import 'image_gallery_viewer.dart';

class JournalProfileScreen extends StatefulWidget {
  const JournalProfileScreen({super.key});

  @override
  State<JournalProfileScreen> createState() => _JournalProfileScreenState();
}

class _JournalProfileScreenState extends State<JournalProfileScreen> {
  String name = 'Mina_Official';
  String username = 'Mina';
  String bio = "I'm a dancer and singer in Cambodia. I love travelling:)";
  File? profileImage;

  // Sample data for stories and posts
  List<Map<String, dynamic>> stories = [
    {'title': 'New', 'isAdd': true},
    {
      'title': 'Sea',
      'images': [
        'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400',
      ],
    },
    {
      'title': 'SR',
      'images': [
        'https://images.unsplash.com/photo-1743601567013-b72682fdc511?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
    },
    {
      'title': 'Design',
      'images': [
        'https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?w=400',
      ],
    },
  ];

  List<String> postImages = [
    'https://images.unsplash.com/photo-1747134392756-96ac368ad361?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400',
    'https://images.unsplash.com/photo-1749984340771-c3a967db0a28?q=80&w=1166&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?w=400',
    'https://images.unsplash.com/photo-1528181304800-259b08848526?w=400',
    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
    'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=400',
    'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=400',
    'https://images.unsplash.com/photo-1580837119756-563d608dd119?w=400',
  ];

  int _selectedTabIndex = 0; // 0 for posts, 1 for saved

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Mina_Official';
      username = prefs.getString('username') ?? 'Mina';
      bio =
          prefs.getString('bio') ??
          "I'm a dancer and singer in Cambodia. I love travelling:)";
      final imagePath = prefs.getString('profile_image');
      if (imagePath != null) {
        profileImage = File(imagePath);
      }
    });
  }

  void _openStoryViewer(List<String> images, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StoryViewerScreen(imageUrls: images, title: title),
      ),
    );
  }

  void _createNewStory() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateStoryScreen()),
    );

    if (result != null) {
      setState(() {
        stories.insert(1, {
          'title': result['title'],
          'localImages': result['images'],
        });
      });
    }
  }

  void _openImageGallery(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) =>
                ImageGalleryViewer(imageUrls: postImages, initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock, size: 16, color: Colors.black),
            const SizedBox(width: 8),
            Text(
              'Mina',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileMenuScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF00BCD4),
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          profileImage != null
                              ? FileImage(profileImage!)
                              : const AssetImage('assets/images/p2.jpg')
                                  as ImageProvider,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              '54',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Posts', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(
                          width: 80,
                          child: OutlinedButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const EditProfileScreen(),
                                ),
                              );
                              _loadData();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bio Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mina_Official',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "I'm a dancer and singer in Cambodia. I love travelling:)",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Story Highlights
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  return _buildStoryHighlight(
                    story['title'],
                    isAdd: story['isAdd'] ?? false,
                    onTap: () {
                      if (story['isAdd'] == true) {
                        _createNewStory();
                      } else if (story['images'] != null) {
                        _openStoryViewer(story['images'], story['title']);
                      } else if (story['localImages'] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => StoryViewerScreen(
                                  imageUrls: [],
                                  localImages: story['localImages'],
                                  title: story['title'],
                                ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Tab Bar
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                _selectedTabIndex == 0
                                    ? Colors.black
                                    : Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.grid_on,
                        color:
                            _selectedTabIndex == 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                _selectedTabIndex == 1
                                    ? Colors.black
                                    : Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.bookmark_border,
                        color:
                            _selectedTabIndex == 1 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content based on selected tab
            _selectedTabIndex == 0
                ? _buildPhotoGrid()
                : _buildSavedPlacesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryHighlight(
    String title, {
    bool isAdd = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isAdd ? Colors.grey : const Color(0xFF00BCD4),
                  width: 2,
                ),
                color: isAdd ? Colors.grey[100] : null,
              ),
              child:
                  isAdd
                      ? const Icon(Icons.add, color: Colors.grey, size: 24)
                      : Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
            ),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: postImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _openImageGallery(index),
          child: Image.network(
            postImages[index],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey, size: 40),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSavedPlacesList() {
    final savedPlaces = [
      {
        'name': 'Angkor Wat',
        'description':
            "That is the most popular place we're highly recommend to your for visit it, enjoy and be chill with your love here.",
        'imageUrl':
            'https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?w=400',
        'rating': 5.0,
      },
      {
        'name': 'Preah Vihea',
        'description':
            "That is the most popular place we're highly recommend to your for visit it, enjoy and be chill with your love here.",
        'imageUrl':
            'https://images.unsplash.com/photo-1563492065-4c9d4d6a2d3e?w=400',
        'rating': 5.0,
      },
      {
        'name': 'Angkor Wat',
        'description':
            "That is the most popular place we're highly recommend to your for visit it, enjoy and be chill with your love here.",
        'imageUrl':
            'https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?w=400',
        'rating': 5.0,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    place['imageUrl'] as String,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place['name'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        place['description'] as String,
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
                                starIndex < (place['rating'] as double)
                                    ? Colors.amber
                                    : Colors.grey[300],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Toggle save functionality
                  },
                  icon: const Icon(
                    Icons.bookmark,
                    color: Color(0xFF00BCD4),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
