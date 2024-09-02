import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class TopCategoriesSection extends StatelessWidget {
  const TopCategoriesSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    // Define categories
    final List<Category> categories = [
      Category(name: 'Academic', color: Colors.purple),
      Category(name: 'Technical', color: Colors.blue),
      Category(name: 'Vocational', color: Colors.orange),
      Category(name: 'Others', color: Colors.yellow),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Top Categories',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        // Use ListView.builder for lazy loading of CategoryCards
        SizedBox(
          height: 120.0, // Set a fixed height for the scrolling area
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CategoryCard(
                  category: categories[index].name,
                  color: categories[index].color,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final Color color;

  const CategoryCard({
    super.key,
    required this.category,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final Color color;

  Category({required this.name, required this.color});
}
