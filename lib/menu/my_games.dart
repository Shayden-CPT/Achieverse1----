import 'package:flutter/material.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';

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
            image: AssetImage('assets/images/background.jpg'), // Overall page background
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3, // Fit 3 game widgets in a row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(games.length, (index) {
            return GameTile(
              title: games[index]['title']!,
              description: games[index]['description']!,
              imageAsset: games[index]['imageAsset']!, // Use asset images for each game
              onPlay: () {
                print('Playing ${games[index]['title']}');
              },
            );
          }),
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
    {
      'title': 'Science Explorer',
      'description': 'Explore scientific concepts through fun experiments.',
      'imageAsset': 'assets/images/games-science.jpg',
    },
    {
      'title': 'Trivia Challenge',
      'description': 'Test your knowledge with trivia questions.',
      'imageAsset': 'assets/images/games-trivia.png',
    },
    {
      'title': 'Puzzle Master',
      'description': 'Complete puzzles to unlock new levels.',
      'imageAsset': 'assets/images/games-puzzlemaster.jpg',
    },
    {
      'title': 'Memory Match',
      'description': 'Match pairs of cards in this memory game.',
      'imageAsset': 'assets/images/games-memory.jpg',
    },
    {
      'title': 'Adventure Land',
      'description': 'Embark on an epic adventure.',
      'imageAsset': 'assets/images/games-adventure.webp',
    },
    {
      'title': 'Speed Racer',
      'description': 'Race against time and other players.',
      'imageAsset': 'assets/images/games-racing.avif',
    },
    {
      'title': 'Mystery Solver',
      'description': 'Solve mysteries and puzzles.',
      'imageAsset': 'assets/images/games-mystery.jpg',
    },
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
            image: AssetImage(imageAsset), // Individual background image for each game widget
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
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
