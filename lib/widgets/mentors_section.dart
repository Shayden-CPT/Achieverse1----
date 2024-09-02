import 'package:flutter/material.dart';
import '../models/mentor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class MentorsSection extends StatelessWidget {
  const MentorsSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    final List<Mentor> mentors = [
      Mentor(name: 'Uzair Richards', subject: 'English', rating: 5.0, image: 'path/to/image1.jpg'),
      Mentor(name: 'Mahomed Goolem', subject: 'Web Development', rating: 4.8, image: 'path/to/image2.jpg'),
      Mentor(name: 'Iviwe Iyamah', subject: 'Programming', rating: 4.9, image: 'path/to/image3.jpg'),
      Mentor(name: 'Erin Steward', subject: 'Physics', rating: 5.0, image: 'path/to/image4.jpg'),
      Mentor(name: 'Shayden Knight', subject: 'Flutter and Dart', rating: 5.0, image: 'path/to/image5.jpg'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meet Our Mentors',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: mentors.map((mentor) => MentorCard(mentor: mentor, fontSize: bodyFontSize)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final Mentor mentor;
  final double fontSize;

  const MentorCard({super.key, required this.mentor, required this.fontSize});

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
              mentor.image.isNotEmpty 
                ? CircleAvatar(
                    radius: 32.0,
                    backgroundImage: AssetImage(mentor.image), // Load image from assets
                  )
                : CircleAvatar(
                    radius: 32.0,
                    child: Text(mentor.name[0]),
                  ),
              const SizedBox(height: 8.0),
              Text(
                mentor.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
              Text(
                mentor.subject,
                style: TextStyle(fontSize: fontSize),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Text(
                    '${mentor.rating}',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
