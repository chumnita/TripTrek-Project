import 'package:flutter/material.dart';
import 'package:triptrek/widgets/notification_list_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 0),
                const Text(
                  'Notification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Color(0xFF4ECDC4), // ✅ Thin teal line
                    indicatorWeight: 0.5,
                    labelColor: Color(0xFF4ECDC4), // ✅ Teal for selected tab
                    unselectedLabelColor: Colors.black54,
                    padding: EdgeInsets.only(
                      left: 1,
                    ), // tab bar starts flush-ish left
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ), // each tab is nicely spaced
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: [
                      Tab(text: 'ALL'),
                      Tab(text: 'Journal'),
                      Tab(text: 'Events'),
                      Tab(text: 'Promotion'),
                    ],
                  ),
                ),
                Container(color: Colors.transparent),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            const NotificationListView(), // ALL
            NotificationListView(typeFilter: 'journal'),
            NotificationListView(typeFilter: 'event'),
            NotificationListView(typeFilter: 'promotion'),
          ],
        ),
      ),
    );
  }
}
