import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class MyGames extends StatelessWidget {
  MyGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Games'),
        backgroundColor: Colors.tealAccent,
      ),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: games.length,
          itemBuilder: (context, index) {
            return GameTile(
              title: games[index]['title']!,
              description: games[index]['description']!,
              imageAsset: games[index]['imageAsset']!,
              onPlay: () {
                print('Playing ${games[index]['title']}');
              },
            );
          },
        ),
      ),
    );
  }

  final List<Map<String, String>> games = [
    {
      'title': 'Math Quest',
      'description': 'Solve math puzzles to advance through levels.',
      'imageAsset': 'assets/images/games-math.png',
    },
    {
      'title': 'Word Wizard',
      'description': 'Create words from jumbled letters.',
      'imageAsset': 'assets/images/games-word.jpg',
    },
    // Add other games here...
  ];
}

class GameTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final VoidCallback onPlay;

  const GameTile({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: imageAsset,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onPlay,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Play'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
