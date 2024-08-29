// widgets/dev_feed_widget.dart
import 'package:flutter/material.dart';

class DevFeedWidget extends StatelessWidget {
  final String topic;

  const DevFeedWidget({super.key, required this.topic, required String imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/dev.webp'),
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

  const ArticleWidget({super.key, required this.topic, required String imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/article_bg.jpg'),
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