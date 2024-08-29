// settings_page.dart
import 'package:flutter/material.dart';
import 'nav_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings content goes here'),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}