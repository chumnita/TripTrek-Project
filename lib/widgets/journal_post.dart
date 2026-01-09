// journal_post.dart (updated with edit/delete options)
import 'package:flutter/material.dart';
import '../screens/s3-journal/createpost.dart';

class JournalPost extends StatefulWidget {
  final Map<String, dynamic> data;
  final VoidCallback onCommentTap;
  final Function(Map<String, dynamic>) onEdit;
  final VoidCallback onDelete;

  const JournalPost({
    super.key,
    required this.data,
    required this.onCommentTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<JournalPost> createState() => _JournalPostState();
}

class _JournalPostState extends State<JournalPost> {
  int currentImage = 0;
  bool isLiked = false;

  void _showOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Post'),
            onTap: () async {
              Navigator.pop(context);
              final updatedPost = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreatePost(existingData: widget.data),
                ),
              );
              if (updatedPost != null) widget.onEdit(updatedPost);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Post'),
            onTap: () {
              Navigator.pop(context);
              widget.onDelete();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(widget.data['images'] ?? []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/women/17.jpg',
            ),
          ),
          title: Text(
            widget.data['author'] ?? 'Unknown',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.data['location'] ?? ''),
          trailing: IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: _showOptions,
          ),
        ),
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                onPageChanged: (i) => setState(() => currentImage = i),
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(Icons.broken_image, size: 80),
                    ),
                  );
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${currentImage + 1}/${images.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: currentImage == index ? 10 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentImage == index
                            ? Colors.white
                            : Colors.white60,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => isLiked = !isLiked),
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.mode_comment_outlined),
                onPressed: widget.onCommentTap,
              ),
              const SizedBox(width: 16),
              const Icon(Icons.save_alt),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Liked by ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: widget.data['likes'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: ' and ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '${widget.data['likeCount']} others',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${widget.data['username']} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: widget.data['caption'] ?? ''),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            widget.data['date'] ?? '',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
