import 'package:flutter/material.dart';
import '../models/course.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';

class PopularCoursesSection extends StatelessWidget {
  const PopularCoursesSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize =
        screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize =
        screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16
    final List<Course> courses = [
      Course(
        title: 'Digital Marketing & with Basics to Advance',
        author: 'Nashied Lampe',
        rating: 5.0,
        price: 19.60,
        originalPrice: 25.27,
        imageUrl: 'assets/images/digital marketing.jpg',
        description: 'Digital Marketing ,basics to advance',
      ),
      Course(
        title: 'Design-Led Strategy: Design thinking Process',
        author: 'Angelique Hogan',
        rating: 4.8,
        price: 15.33,
        originalPrice: 20.77,
        imageUrl: '',
        description: '',
      ),
      Course(
        title: 'HTML - Learn programming language with basics',
        author: 'Iviwe Sheldon',
        rating: 4.9,
        price: 13.76,
        originalPrice: 18.67,
        imageUrl: '',
        description: '',
      ),
      Course(
        title: 'Foundations of (UX) Design Basics to Advance',
        author: 'Uzair Richards',
        rating: 4.5,
        price: 16.88,
        originalPrice: 20.77,
        imageUrl: '',
        description: '',
      ),
      Course(
        title: 'Flutter - Learn programming language with basics',
        author: 'Shayden Knight',
        rating: 4.5,
        price: 16.88,
        originalPrice: 20.77,
        imageUrl: '',
        description: '',
      ),
      Course(
        title: 'React JS - Learn programming language with basics',
        author: 'Erin Lee',
        rating: 4.5,
        price: 16.88,
        originalPrice: 20.77,
        imageUrl: '',
        description: '',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popular Courses',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                courses.map((course) => CourseCard(course: course)).toList(),
          ),
        ),
        const SizedBox(height: 16.0),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('View All'),
          ),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

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
              Text(
                course.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('by ${course.author}'),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Text('${course.rating}'),
                ],
              ),
              Text('\$${course.price}'),
              Text(
                '\$${course.originalPrice}',
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
