import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class MyGoals extends StatelessWidget {
  MyGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Goals'),
        backgroundColor: Colors.tealAccent,
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: goals.length,
          itemBuilder: (context, index) {
            return GoalTile(
              title: goals[index]['title']!,
              progress: goals[index]['progress']!,
              icon: goals[index]['icon']!,
            );
          },
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> goals = [
    {
      'title': 'Learn Flutter',
      'progress': 70,
      'icon': Icons.code,
    },
    {
      'title': 'Read Books',
      'progress': 50,
      'icon': Icons.book,
    },
    {
      'title': 'Exercise Regularly',
      'progress': 30,
      'icon': Icons.fitness_center,
    },
    {
      'title': 'Save Money',
      'progress': 80,
      'icon': Icons.monetization_on,
    },
  ];
}

class GoalTile extends StatefulWidget {
  final String title;
  final int progress;
  final IconData icon;

  const GoalTile({
    super.key,
    required this.title,
    required this.progress,
    required this.icon,
  });

  @override
  _GoalTileState createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: ScaleTransition(
        scale: _animation,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, size: 40, color: Colors.teal),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: widget.progress / 100,
                  backgroundColor: Colors.grey[300],
                  color: Colors.teal,
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.progress}%',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
