import 'package:flutter/material.dart';
import '../models/mentor.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';

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
      Mentor(name: 'Uzair Richards', subject: 'English', rating: 5.0, image: ''),
      Mentor(name: 'Mahomed Goolem', subject: 'Web Development', rating: 4.8, image: ''),
      Mentor(name: 'Iviwe Iyamah', subject: 'Programming', rating: 4.9, image: ''),
      Mentor(name: 'Erin Steward', subject: 'Physics', rating: 5.0, image: ''),
       Mentor(name: 'Shayden Knight', subject: 'Flutter and Dart', rating: 5.0, image: ''),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Meet Our Mentors',
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
            children: mentors.map((mentor) => MentorCard(mentor: mentor)).toList(),
          ),
        ),
      ],
    );
  }
}

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({super.key, required this.mentor});

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
              CircleAvatar(
                radius: 32.0,
                child: Text(mentor.name[0]),
              ),
              const SizedBox(height: 8.0),
              Text(
                mentor.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(mentor.subject),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Text('${mentor.rating}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}