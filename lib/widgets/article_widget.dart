// widgets/article_widget.dart
import 'package:flutter/material.dart';

class ArticlesWidget extends StatelessWidget {
  final String topic;

  const ArticlesWidget({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/softarti.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        color: Colors.black.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latest $topic Articles',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              _articleItem('10 $topic best practices'),
              _articleItem('Getting started with $topic'),
              _articleItem('Advanced $topic techniques'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _articleItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}