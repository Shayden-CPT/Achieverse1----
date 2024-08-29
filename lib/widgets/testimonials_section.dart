import 'package:flutter/material.dart';
import '../models/testimonial.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    final List<Testimonial> testimonials = [
      Testimonial(
        name: 'Jared Rain',
        review: 'E-learning in this way is something that should have begun long ago. The concepts are nothing new because we keep looking for new interactions.',
        rating: 5.0,
      ),
      Testimonial(
        name: 'Nabeel Sten',
        review: 'This course was very interesting & thought-provoking. I would certainly recommend it to any teacher who is trying to work with their students.',
        rating: 5.0,
      ),
      Testimonial(
        name: 'Khoro Smith',
        review: 'I was very impressed with the course. The course was well structured and the teacher was very friendly.',
        rating: 5.0,
      ),
      Testimonial(
        name: 'Awonke Johnson',
        review: 'I have found the course to be very effective. The course was well organized and the teacher was very helpful.',
        rating: 5.0,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Testimonials',
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
            children: testimonials.map((testimonial) => TestimonialCard(testimonial: testimonial)).toList(),
          ),
        ),
      ],
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        color: Colors.yellow.withOpacity(0.2),
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
                  const Icon(Icons.star, color: Colors.amber, size: 16.0),
                  Text('${testimonial.rating}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}