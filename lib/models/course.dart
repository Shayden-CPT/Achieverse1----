 import 'package:flutter/material.dart';
 import 'package:achieverse/responsive_layout.dart';
 import 'package:achieverse/widgets/header_section.dart';

 class Course {
  final String title;
  final String author;
  final double rating;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final String description;

  Course({
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.description,
  });
}

List<Course> courses = [
  Course(
    title: 'HTML - Learn programming language with basics',
    author: 'Iviwe Sheldon',
    rating: 4.9,
    price: 13.76,
    originalPrice: 18.67,
    imageUrl: 'assets/images/html.png',
    description:
        'HTML is the standard markup language for creating web pages. With HTML, you can create the structure of a web page, including headings, paragraphs, images, and more.',
  ),
  Course(
    title: 'CSS - Learn programming language with basics',
    author: 'Ayobami Adebayo',
    rating: 4.9,
    price: 12.26,
    originalPrice: 16.67,
    imageUrl: 'assets/images/css.png',
    description:
        'CSS is used to style the elements on a web page. It allows you to control the layout, colors, fonts, and more.',
  ),
  Course(
    title: 'React JS - Learn programming language with basics',
    author: 'Erin Lee',
    rating: 4.5,
    price: 16.88,
    originalPrice: 20.77,
    imageUrl: 'assets/images/react.png',
    description:
        'React is a popular JavaScript library for building user interfaces. It allows you to create reusable UI components and manage the state of your application.',
  ),
  Course(
    title: 'Physics - Learn the basics of Physics',
    author: 'John Doe',
    rating: 4.5,
    price: 16.88,
    originalPrice: 20.77,
    imageUrl: 'assets/images/physics.png',
    description:
        'Physics is the scientific study of the natural world, covering topics such as motion, energy, forces, and matter.',
  ),
  Course(
    title: 'Web Development - Learn how to build websites',
    author: 'Jane Smith',
    rating: 4.9,
    price: 13.76,
    originalPrice: 18.67,
    imageUrl: 'assets/images/webdev.png',
    description:
        'Web development is the process of creating websites and web applications. It involves using HTML, CSS, and JavaScript to design and build functional websites.',
  ),
  Course(
    title: 'Flutter - Learn to build Android and iOS apps',
    author: 'Mark Johnson',
    rating: 4.5,
    price: 16.88,
    originalPrice: 20.77,
    imageUrl: 'assets/images/flutter.png',
    description:
        'Flutter is an open-source UI toolkit that allows you to build natively compiled applications for mobile, web, and desktop from a single codebase.',
  ),
  Course(
    title: 'Android Development - Learn how to build Android apps',
    author: 'Sarah Williams',
    rating: 4.5,
    price: 16.88,
    originalPrice: 20.77,
    imageUrl: 'assets/images/android.png',
    description:
        'Android development is the process of creating applications for the Android operating system. It involves using Java or Kotlin to design and build functional Android apps.',
  ),
  Course(
    title: 'Artificial Intelligence - Learn the basics of AI',
    author: 'Michael Brown',
    rating: 4.5,
    price: 16.88,
    originalPrice: 20.77,
    imageUrl: 'assets/images/ai.png',
    description:
        'Artificial intelligence (AI) is the study of how to build machines that can think and act like humans. It involves topics such as machine learning and natural language processing.',
  ),
];
