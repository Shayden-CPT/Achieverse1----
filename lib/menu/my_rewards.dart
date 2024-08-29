import 'package:flutter/material.dart';
import 'package:achieverse/menu/menu_drawer.dart'; // Import the MenuDrawer
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';

class MyRewards extends StatelessWidget {
  MyRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Rewards'),
        backgroundColor: Colors.tealAccent,
      ),
      drawer: const MenuDrawer(), // Add the drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(rewards.length, (index) {
            return RewardTile(
              title: rewards[index]['title']!,
              description: rewards[index]['description']!,
              icon: rewards[index]['icon']!,
            );
          }),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> rewards = [
    {
      'title': 'Reading Champion',
      'description': 'Spent 50 hours reading.',
      'icon': Icons.book,
    },
    {
      'title': 'Course Completer',
      'description': 'Completed 5 courses.',
      'icon': Icons.school,
    },
    {
      'title': 'Daily Login',
      'description': 'Logged in every day for a week.',
      'icon': Icons.login,
    },
    {
      'title': 'Connection Maker',
      'description': 'Made 20 connections.',
      'icon': Icons.people,
    },
    {
      'title': 'Coding Ninja',
      'description': 'Mastered coding skills.',
      'icon': Icons.code,
    },
    {
      'title': 'UI Master',
      'description': 'Excelled in UI design.',
      'icon': Icons.design_services,
    },
    {
      'title': 'UX Jedi',
      'description': 'Achieved UX mastery.',
      'icon': Icons.accessibility,
    },
    {
      'title': 'Front End Expert',
      'description': 'Expert in front-end development.',
      'icon': Icons.web,
    },
    {
      'title': 'Back-end King',
      'description': 'Mastered back-end technologies.',
      'icon': Icons.storage,
    },
    {
      'title': 'Full Stack Champion',
      'description': 'Skilled in full-stack development.',
      'icon': Icons.developer_board,
    },
    {
      'title': 'C# Wizard',
      'description': 'Expert in C# programming.',
      'icon': Icons.code,
    },
    {
      'title': 'Flutter Legend',
      'description': 'Mastered Flutter framework.',
      'icon': Icons.flutter_dash,
    },
    {
      'title': 'Android Developer',
      'description': 'Expert in Android development.',
      'icon': Icons.android,
    },
    {
      'title': 'iOS Developer',
      'description': 'Expert in iOS development.',
      'icon': Icons.apple,
    },
    {
      'title': 'Windows Brain',
      'description': 'Expert in Windows applications.',
      'icon': Icons.window,
    },
    {
      'title': 'MacOS Knight',
      'description': 'Expert in MacOS applications.',
      'icon': Icons.computer,
    },
    {
      'title': 'Web Development Prince',
      'description': 'Skilled in web development.',
      'icon': Icons.public,
    },
  ];
}

class RewardTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const RewardTile({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
