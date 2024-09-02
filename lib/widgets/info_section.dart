import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InfoCard(
              icon: Icons.people,
              title: 'World Best Instructors',
              subtitle: '150 courses',
              titleFontSize: titleFontSize,
              bodyFontSize: bodyFontSize,
            ),
            const SizedBox(width: 16),
            InfoCard(
              icon: Icons.live_tv,
              title: 'Live Class & Video Courses',
              subtitle: '300 Courses',
              titleFontSize: titleFontSize,
              bodyFontSize: bodyFontSize,
            ),
            const SizedBox(width: 16),
            InfoCard(
              icon: Icons.people_outline,
              title: 'Over Active Students',
              subtitle: '4,000 Students',
              titleFontSize: titleFontSize,
              bodyFontSize: bodyFontSize,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double titleFontSize;
  final double bodyFontSize;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.titleFontSize,
    required this.bodyFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 48.0),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: bodyFontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
