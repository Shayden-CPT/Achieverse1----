import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class PopularCoursesSection extends StatelessWidget {
  const PopularCoursesSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    final List<Course> courses = [
      Course(
        title: 'Digital Marketing & with Basics to Advance',
        author: 'Nashied Lampe',
        rating: 5.0,
        price: 19.60,
        originalPrice: 25.27,
        imageUrl: 'assets/images/digital_marketing.jpg',
        description: 'Digital Marketing ,basics to advance',
      ),
      Course(
        title: 'Design-Led Strategy: Design thinking Process',
        author: 'Angelique Hogan',
        rating: 4.8,
        price: 15.33,
        originalPrice: 20.77,
        imageUrl: 'assets/images/design_thinking.jpg',
        description: '',
      ),
      Course(
        title: 'HTML - Learn programming language with basics',
        author: 'Iviwe Sheldon',
        rating: 4.9,
        price: 13.76,
        originalPrice: 18.67,
        imageUrl: 'assets/images/html_basics.jpg',
        description: '',
      ),
      Course(
        title: 'Foundations of (UX) Design Basics to Advance',
        author: 'Uzair Richards',
        rating: 4.5,
        price: 16.88,
        originalPrice: 20.77,
        imageUrl: 'assets/images/ux_design.jpg',
        description: '',
      ),
      Course(
        title: 'Flutter - Learn programming language with basics',
        author: 'Shayden Knight',
        rating: 4.5,
        price: 16.88,
        originalPrice: 20.77,
        imageUrl: 'assets/images/flutter_basics.jpg',
        description: '',
      ),
      Course(
        title: 'React JS - Learn programming language with basics',
        author: 'Erin Lee',
        rating: 4.5,
        price: 16.88,
        originalPrice: 20.77,
        imageUrl: 'assets/images/react_js.jpg',
        description: '',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popular Courses',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        // Use ListView.builder for better performance
        SizedBox(
          height: 300, // Set height to control the height of the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseCard(course: courses[index], fontSize: bodyFontSize);
            },
          ),
        ),
        const SizedBox(height: 16.0),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Implement the 'View All' functionality
            },
            child: const Text('View All'),
          ),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  final double fontSize;

  const CourseCard({super.key, required this.course, required this.fontSize});

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
              course.imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: course.imageUrl,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : const CircleAvatar(
                    radius: 32.0,
                    child: Icon(Icons.book),
                  ),
              const SizedBox(height: 8.0),
              Text(
                course.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
              Text(
                'by ${course.author}',
                style: TextStyle(fontSize: fontSize),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Text(
                    '${course.rating}',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
              Text(
                '\$${course.price}',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                '\$${course.originalPrice}',
                style: TextStyle(
                  fontSize: fontSize,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
