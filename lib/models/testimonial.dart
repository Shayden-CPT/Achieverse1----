
import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';

class Testimonial {
  final String name;
  final String review;
  final double rating;

  Testimonial({
    required this.name,
    required this.review,
    required this.rating,
  });
}

class TestimonialsPage extends StatelessWidget {
  final List<Testimonial> testimonials = [
    Testimonial(
      name: 'Jane Smith',
      review: 'I was blown away by how easy it was to use the app. I highly recommend it!',
      rating: 5.0,
    ),
    Testimonial(
      name: 'John Doe',
      review: 'The app really helped me achieve my goals. I would definitely use it again.',
      rating: 4.5,
    ),
    Testimonial(
      name: 'Jessica Johnson',
      review: 'I was skeptical at first, but the app really delivered. It\'s a must-have!',
      rating: 4.8,
    ),
  ];

   TestimonialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testimonials'),
      ),
      body: ListView.builder(
        itemCount: testimonials.length,
        itemBuilder: (context, index) {
          final testimonial = testimonials[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(testimonial.review),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      for (int i = 0; i < testimonial.rating.round(); i++)
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
