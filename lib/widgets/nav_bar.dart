import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showSettingsPanel(context);
            },
          ),
        ],
      ),
    );
  }

  void _showSettingsPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text('Theme'),
                onTap: () {
                  // Implement theme change logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.font_download),
                title: const Text('Font Size'),
                onTap: () {
                  // Implement font size change logic
                },
              ),
              // Add more settings options as needed
            ],
          ),
        );
      },
    );
  }
}