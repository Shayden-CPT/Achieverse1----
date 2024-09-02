import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class StatsSection extends StatelessWidget {
  const StatsSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    // Use const constructor for StatelessWidget to enable tree-shaking and performance optimizations
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: _StatsContent(),
    );
  }
}

class _StatsContent extends StatelessWidget {
  const _StatsContent();

  @override
  Widget build(BuildContext context) {
    // Wrap the Row in a SingleChildScrollView for horizontal scrolling
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          _StatItem(title: '1400+', subtitle: 'Fresh Graduates'),
          SizedBox(width: 16),
          _StatItem(title: '5', subtitle: 'Years of Experience'),
          SizedBox(width: 16),
          _StatItem(title: '10', subtitle: 'Excellence Awards'),
          SizedBox(width: 16),
          _StatItem(title: '5', subtitle: 'Brand Partners'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0, // Adjust as needed for responsiveness
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14.0, // Adjust as needed for responsiveness
            ),
          ),
        ],
      ),
    );
  }
}
