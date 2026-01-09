import 'package:flutter/material.dart';

const destinations = [
  'assets/images/show-1.jpg',
  'assets/images/show-2.jpg',
  'assets/images/show-5.jpg',
];

const provinces = [
  {'name': 'KOH RONG', 'img': 'assets/images/province-1.png'},
  {'name': 'PREAH VIHEAR', 'img': 'assets/images/province-2.png'},
  {'name': 'PHNOM PENH', 'img': 'assets/images/province-3.png'},
  {'name': 'KOMPOT', 'img': 'assets/images/province-3.png'},
];

const events = [
  {
    'title': 'Water Festival',
    'date': '4 Nov - 6 Nov',
    'location': 'Phnom Penh, Cambodia',
    'desc':
        'The Water Festival 2025 in Cambodia celebrates Tonle Sap River’s flow reversal. Boat races, fireworks, and more.',
    'img': 'assets/images/event-1.jpg',
  },
];

const topProvinces = [
  {'name': 'Phnom Penh', 'img': 'assets/images/top-1.jpg'},
  {'name': 'Mondukiri', 'img': 'assets/images/top-2.jpg'},
  {'name': 'Kep', 'img': 'assets/images/top-3.jpg'},
];

const notificationsToday = [
  {
    'type': 'like_comment',
    'category': 'journal',
    'avatar': 'assets/images/avater-1.png',
    'username': 'karennne',
    'action': 'liked',
    'target': "martini_rond's comment",
    'mention': '@martini_rond',
    'text': 'Nice! 3rd March',
  },
  {
    'type': 'like_photo',
    'category': 'journal',
    'avatar': 'assets/images/avater-2.png',
    'users': ['kiero_d', 'zackjohn', 'craig_love'],
    'action': 'liked',
    'target': 'joshua_l',
    'img': 'assets/images/noti-1.png',
    'time': '3h',
  },
  {
    'type': 'event',
    'category': 'event',
    'icon': Icons.event,
    'text': 'Hotel have promotion on Khmer New Year',
  },
];

const notificationsMonth = [
  {
    'type': 'promo',
    'category': 'promotion',
    'icon': Icons.settings,
    'text': 'Restaurant have promotion on Khmer New Year',
  },
];

const profileData = {
  'name': 'Mina',
  'username': 'Mina_Official',
  'bio': "I'm a dancer and singer in Cambodia. I love travelling:)",
  'avatar': 'assets/images/avater-1.png',
  'posts': 54,
};

const highlights = [
  {'label': 'New', 'icon': true},
  {'label': 'Sea', 'img': 'assets/images/sea.jpg'},
];

final List<Map<String, Object>> mockProfilePosts = [
  {'img': 'assets/images/.jpg', 'label': 'Sunset View'},
  {'img': 'assets/images/post2.jpg', 'label': 'River Walk'},
  {'img': 'assets/images/post3.jpg', 'label': 'City Lights'},
  // Add more...
];
