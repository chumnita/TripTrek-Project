import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triptrek/widgets/journal_post.dart';
import 'package:triptrek/widgets/story_section.dart';
import 'createpost.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  List<Map<String, dynamic>> posts = [
    {
      'author': 'Sarah Verold',
      'location': 'Kep Province, Cambodia',
      'images': [
        'assets/images/journal1.png',
        'assets/images/journal2.png',
        'assets/images/journal3.png',
      ],
      'likes': 'craig_love',
      'likeCount': '44,686',
      'username': 'joshua_l',
      'caption':
          'The game in Cambodia was amazing and I want to share some photos 😊',
      'date': 'September 19',
    },
    {
      'author': 'Anna Bella',
      'location': 'Siem Reap, Cambodia',
      'images': ['assets/images/journal3.png', 'assets/images/journal1.png'],
      'likes': 'sofia_chan',
      'likeCount': '21,124',
      'username': 'anna_b',
      'caption': 'Exploring the temples was a dream come true.',
      'date': 'September 18',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('journalPosts');
    if (stored != null) {
      setState(
        () => posts = List<Map<String, dynamic>>.from(json.decode(stored)),
      );
    }
  }

  Future<void> _savePosts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('journalPosts', json.encode(posts));
  }

  void _showComments() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => const SizedBox(
            height: 300,
            child: Center(child: Text('Comment sheet here')),
          ),
    );
  }

  void _navigateToCreatePost({
    Map<String, dynamic>? existingData,
    int? index,
  }) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreatePost(existingData: existingData ?? {}),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        if (index != null) {
          posts[index] = result;
        } else {
          posts.insert(0, result);
        }
      });
      _savePosts();
    }
  }

  void _deletePost(int index) {
    setState(() => posts.removeAt(index));
    _savePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Journal',
          style: TextStyle(color: Colors.teal, fontFamily: 'Serif'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.teal),
            onPressed: () => _navigateToCreatePost(),
          ),
          const SizedBox(width: 8), // Gap between the two icons
          const Padding(
            padding: EdgeInsets.only(
              right: 12.0,
            ), // Align with IconButton padding
            child: Icon(Icons.search, color: Colors.teal),
          ),
        ],
      ),
      body: ListView(
        children: [
          const StorySection(),
          ...posts.asMap().entries.map((entry) {
            final index = entry.key;
            final post = entry.value;
            return JournalPost(
              data: post,
              onCommentTap: _showComments,
              onEdit:
                  (updatedData) => _navigateToCreatePost(
                    existingData: updatedData,
                    index: index,
                  ),
              onDelete: () => _deletePost(index),
            );
          }),
        ],
      ),
    );
  }
}
