import 'package:flutter/material.dart';
import '/data/mock_data.dart';

class NotificationListView extends StatelessWidget {
  final String? typeFilter;
  const NotificationListView({super.key, this.typeFilter});

  @override
  Widget build(BuildContext context) {
    final todayFiltered =
        notificationsToday.where((notif) {
          if (typeFilter == null) return true;
          return notif['category'] == typeFilter;
        }).toList();

    final monthFiltered =
        notificationsMonth.where((notif) {
          if (typeFilter == null) return true;
          return notif['category'] == typeFilter;
        }).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        const Text('Today', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),

        if (todayFiltered.isEmpty)
          const Center(child: Text('No notifications')), // empty state

        ...todayFiltered.map((notif) {
          final type = notif['type'] as String;

          if (type == 'like_comment') {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF4ECDC4),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      notif['avatar'] as String? ?? '',
                    ),
                  ),
                ),
                const SizedBox(width: 20, height: 60),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: '${notif['username']} '),
                        const TextSpan(
                          text: 'liked ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text: "${notif['target']}: "),
                        TextSpan(
                          text: notif['mention'] as String? ?? '',
                          style: const TextStyle(color: Colors.teal),
                        ),
                        TextSpan(
                          text: ' ${notif['text'] as String? ?? ''}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (type == 'like_photo') {
            return Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    notif['avatar'] as String? ?? '',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text:
                              '${(notif['users'] as List<String>).join(", ")} ',
                        ),
                        const TextSpan(
                          text: 'liked ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text: "${notif['target']} photo. "),
                        TextSpan(
                          text: notif['time'] as String? ?? '',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    notif['img'] as String? ?? '',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          } else if (type == 'event') {
            return Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    notif['icon'] as IconData?,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: 20, height: 60),
                Expanded(
                  child: Text(
                    notif['text'] as String? ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        }),

        const SizedBox(height: 30),
        const Text('This month', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),

        ...monthFiltered.map((notif) {
          return Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade200,
                child: Icon(notif['icon'] as IconData?, color: Colors.black54),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  notif['text'] as String? ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
