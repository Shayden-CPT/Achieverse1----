import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:achieverse/menu/menu_drawer.dart'; // Import the MenuDrawer
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

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
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isDesktop) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  return RewardTile(
                    title: rewards[index]['title']!,
                    description: rewards[index]['description']!,
                    icon: rewards[index]['icon']!,
                  );
                },
              );
            } else if (sizingInformation.isTablet) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  return RewardTile(
                    title: rewards[index]['title']!,
                    description: rewards[index]['description']!,
                    icon: rewards[index]['icon']!,
                  );
                },
              );
            } else {
              return ListView.builder(
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  return RewardTile(
                    title: rewards[index]['title']!,
                    description: rewards[index]['description']!,
                    icon: rewards[index]['icon']!,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> rewards = [
    // Your reward data
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
    // More rewards...
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
