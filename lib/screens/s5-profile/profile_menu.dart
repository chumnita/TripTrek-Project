// lib/screens/s5-profile/profile_menu.dart
import 'package:flutter/material.dart';
import 'logout_dialog.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/p2.jpg'),
            ),
            title: Text('Mina_Official'),
          ),
          const Divider(),
          _buildMenuItem(Icons.person, 'Profile', () {}),
          _buildMenuItem(Icons.favorite_border, 'Favourite', () {}),
          _buildMenuItem(Icons.settings, 'Setting', () {}),
          _buildMenuItem(Icons.event_note, 'My plan', () {}),
          _buildMenuItem(Icons.history, 'History', () {}),
          _buildMenuItem(Icons.logout, 'Logout', () {
            showDialog(
              context: context,
              builder: (context) => const LogoutConfirmationDialog(),
            );
          }, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color color = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      onTap: onTap,
    );
  }
}
