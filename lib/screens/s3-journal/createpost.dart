import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePost extends StatefulWidget {
  final Map<String, dynamic>? existingData;

  const CreatePost({super.key, this.existingData});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController captionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController mentionsController = TextEditingController();
  final List<File> selectedImages = [];

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.existingData != null) {
      captionController.text = widget.existingData!['caption'] ?? '';
      locationController.text = widget.existingData!['location'] ?? '';
      if (captionController.text.contains('@')) {
        final parts = captionController.text.split('@');
        captionController.text = parts[0].trim();
        mentionsController.text = parts.length > 1 ? parts[1].trim() : '';
      }
      final List images = widget.existingData!['images'] ?? [];
      selectedImages.addAll(images.map((path) => File(path)));
    }
  }

  Future<void> pickImagesFromGallery() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        selectedImages.addAll(pickedFiles.map((xfile) => File(xfile.path)));
      });
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        selectedImages.add(File(image.path));
      });
    }
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    pickImagesFromGallery();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take a Photo'),
                  onTap: () {
                    Navigator.pop(context);
                    pickImageFromCamera();
                  },
                ),
              ],
            ),
          ),
    );
  }

  void submitPost() {
    if (selectedImages.isEmpty || captionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please add at least one image and a caption."),
        ),
      );
      return;
    }

    final newPost = {
      'author': 'You',
      'location': locationController.text,
      'images': selectedImages.map((f) => f.path).toList(),
      'likes': 'you',
      'likeCount': '0',
      'username': 'you',
      'caption':
          captionController.text +
          (mentionsController.text.isNotEmpty
              ? " @${mentionsController.text}"
              : ""),
      'date': DateTime.now().toString().split(' ').first,
    };

    Navigator.pop(context, newPost);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existingData != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  isEdit ? 'New Post' : 'Create Post',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 60),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _showImageSourceOptions,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child:
                    selectedImages.isEmpty
                        ? const Center(child: Icon(Icons.add_a_photo, size: 40))
                        : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedImages.length,
                          itemBuilder:
                              (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(selectedImages[index]),
                                ),
                              ),
                        ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Add a caption'),
            const SizedBox(height: 8),
            TextField(
              controller: captionController,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText:
                    'Describes of your Travel Journey. Travellers will love to know your experience',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.location_on_outlined, color: Colors.green),
                SizedBox(width: 8),
                Text('Location'),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                hintText: 'Enter Travel Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.group_outlined, color: Colors.green),
                SizedBox(width: 8),
                Text('Mentions'),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: mentionsController,
              decoration: const InputDecoration(
                hintText: 'Mention friends (@username)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: submitPost,
              child: Text(
                isEdit ? 'Submit' : 'Update',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
