import 'package:achieverse/menu/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';


class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Offerings',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Course Offerings'),
        ),
        drawer: const MenuDrawer(),
        body: const CourseHomePage(),
      ),
    );
  }
}

class CourseHomePage extends StatelessWidget {
  const CourseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Offerings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(imagePath: '',),
            CourseSection(
              title: 'Short Courses',
              courses: [
                CourseItem(title: 'HTML & CSS', description: 'Learn the basics of web development with HTML and CSS.'),
                CourseItem(title: 'JavaScript', description: 'Master the fundamentals of JavaScript for interactive web applications.'),
                CourseItem(title: 'React JS', description: 'Build dynamic user interfaces with React JS.'),
                CourseItem(title: 'Flutter & Dart', description: 'Develop beautiful mobile applications using Flutter and Dart.'),
                CourseItem(title: 'Firebase', description: 'Learn how to use Firebase for backend services in your applications.'),
              ],
            ),
            CourseSection(
              title: 'Long Courses',
              courses: [
                CourseItem(title: 'Web Development', description: 'A comprehensive course covering front-end and back-end web development.'),
                CourseItem(title: 'Android Development', description: 'Learn to build Android applications from scratch.'),
                CourseItem(title: 'iOS Development', description: 'Master the skills needed to develop iOS applications.'),
                CourseItem(title: 'React Native', description: 'Create cross-platform mobile applications using React Native.'),
                CourseItem(title: '.NET Maui', description: 'Build cross-platform applications with .NET Maui.'),
                CourseItem(title: 'Physics', description: 'Understand the fundamental principles of physics.'),
                CourseItem(title: 'C#', description: 'Learn C# programming for various applications.'),
                CourseItem(title: 'C++', description: 'Master C++ for high-performance applications.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: const Column(
        children: [
          Text(
            'Welcome to Our Course Offerings',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Your gateway to learning the latest technologies!',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CourseSection extends StatelessWidget {
  final String title;
  final List<CourseItem> courses;

  const CourseSection({super.key, required this.title, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseCard(course: courses[index]);
            },
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final CourseItem course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          course.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(course.description),
        leading: const Icon(Icons.book, color: Colors.teal),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
      ),
    );
  }
}

class CourseItem {
  final String title;
  final String description;

  CourseItem({required this.title, required this.description});
}