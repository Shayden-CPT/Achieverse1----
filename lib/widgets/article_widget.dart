import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class ArticlesWidget extends StatelessWidget {
  final String topic;

  const ArticlesWidget({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImageAsset('assets/images/softarti.jpg'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(snapshot.data as String),
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
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // Asynchronously loads the image asset
  Future<String> _loadImageAsset(String path) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate a delay for demonstration
    return path;
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
