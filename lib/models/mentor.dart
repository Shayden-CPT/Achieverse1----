import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';

class Mentor {
  final String name;
  final String subject;
  final double rating;
  final String image;

  Mentor({
    required this.name,
    required this.subject,
    required this.rating,
    required this.image,
  });

  static List<Mentor> getAllMentors() {
    return [
      Mentor(
          name: 'Uzair Richards',
          subject: 'English',
          rating: 5.0,
          image: 'assets/images/mentor1.jpg'),
      Mentor(
          name: 'Mahomed Goolem',
          subject: 'Web Development',
          rating: 4.8,
          image: 'assets/images/mentor2.jpg'),
      Mentor(
          name: 'Iviwe Iyamah',
          subject: 'Programming',
          rating: 4.9,
          image: 'assets/images/mentor3.jpg'),
      Mentor(
          name: 'Erin Steward',
          subject: 'Physics',
          rating: 5.0,
          image: 'assets/images/mentor4.jpg'),
      Mentor(
          name: 'Shayden Knight',
          subject: 'Flutter and Dart',
          rating: 5.0,
          image: 'assets/images/mentor5.jpg'),
    ];
  }
}

class MentorPage extends StatelessWidget {
  const MentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Mentors'),
      ),
      body: ListView.builder(
        itemCount: Mentor.getAllMentors().length,
        itemBuilder: (context, index) {
          Mentor mentor = Mentor.getAllMentors()[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mentor.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mentor.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            mentor.rating.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Specialises in: ${mentor.subject}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
