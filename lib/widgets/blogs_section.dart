import 'package:flutter/material.dart';
import '../models/blog.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';

class BlogsSection extends StatelessWidget {
  const BlogsSection({super.key, required String imagePath});

  @override

   Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16


  
    final List<Blog> blogs = [
      Blog(
        title: '10 Realities you really want to reconsider before actual profession',
        date: '01/11/2021',
        readTime: 'Free read', user: '', content: '',
      ),
      Blog(
        title: '20 facts you need to reconsider before your short career',
        date: '10/11/2021',
        readTime: '5min read', user: '', content: '',
      ),
      Blog(
        title: 'Discover career that matches your skills & interests in job',
        date: '17/02/2022',
        readTime: '4min read', user: '', content: '',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Read Our Daily Blogs',
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
            children: blogs.map((blog) => BlogCard(blog: blog)).toList(),
          ),
        ),
        const SizedBox(height: 32.0),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Read More'),
          ),
        ),
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({super.key, required this.blog});

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
              Image.network('https://via.placeholder.com/200x100', width: 200, height: 100, fit: BoxFit.cover),
              const SizedBox(height: 8.0),
              Text(
                blog.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              Text(blog.date),
              Text(blog.readTime),
            ],
          ),
        ),
      ),
    );
  }
}