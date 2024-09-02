import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class DevFeedWidget extends StatelessWidget {
  final String topic;
  final String imagePath;

  const DevFeedWidget({super.key, required this.topic, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
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
                '$topic Developer Feed',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              _feedItem('New $topic feature released!'),
              _feedItem('$topic performance optimization tips'),
              _feedItem('Upcoming $topic conference'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _feedItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  final String topic;
  final String imagePath;

  const ArticleWidget({super.key, required this.topic, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
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
