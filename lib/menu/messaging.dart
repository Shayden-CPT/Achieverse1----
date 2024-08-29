import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';

class Messaging extends StatelessWidget {
  const Messaging({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messaging'),
        backgroundColor: Colors.tealAccent,
      ),
      drawer: const MenuDrawer(), // Include the menu drawer here
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return _buildDesktopLayout(context);
          } else if (constraints.maxWidth > 600) {
            return _buildTabletLayout(context);
          } else {
            return _buildMobileLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Chat List
        Expanded(
          flex: 2,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              ChatTile(name: 'Mahomed', message: 'Hey! How are you?', imageUrl: 'assets/alice.jpg'),
              ChatTile(name: 'Iviwe', message: 'Are we still on for the meeting?', imageUrl: 'assets/bob.jpg'),
              ChatTile(name: 'Uzair', message: 'Check out this article!', imageUrl: 'assets/charlie.jpg'),
              ChatTile(name: 'Erin', message: 'Let’s catch up this weekend!', imageUrl: 'assets/diana.jpg'),
              ChatTile(name: 'Shayden', message: 'Looking forward to the event!', imageUrl: 'assets/eve.jpg'),
              ChatTile(name: 'Deen', message: 'Hey! How are you?', imageUrl: 'assets/alice.jpg'),
              ChatTile(name: 'Jenna', message: 'Are we still on for the meeting?', imageUrl: 'assets/bob.jpg'),
              ChatTile(name: 'Melissa', message: 'Check out this article!', imageUrl: 'assets/charlie.jpg'),
              ChatTile(name: 'Jack', message: 'Let’s catch up this weekend!', imageUrl: 'assets/diana.jpg'),
              ChatTile(name: 'Tom', message: 'Looking forward to the event!', imageUrl: 'assets/eve.jpg'),
              // Add more ChatTiles as needed
            ],
          ),
        ),
        // Divider
        const VerticalDivider(width: 1, color: Colors.grey),
        // Notifications Panel
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.teal[50],
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                NotificationTile(
                  title: 'Upcoming Event',
                  description: 'Join us for a Flutter workshop on Aug 10.',
                ),
                SizedBox(height: 8),
                NotificationTile(
                  title: 'New Course Available',
                  description: 'Enroll in the new Dart programming course.',
                ),
                SizedBox(height: 8),
                NotificationTile(
                  title: 'Job Opportunity',
                  description: 'Software Developer position open at XYZ Corp.',
                ),
                SizedBox(height: 8),
                NotificationTile(
                  title: 'Networking Event',
                  description: 'Connect with industry professionals on Aug 15.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Container();
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container();
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String imageUrl;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
          radius: 30,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailScreen(name: name),
            ),
          );
        },
      ),
    );
  }
}
class NotificationTile extends StatelessWidget {
  final String title;
  final String description;

  const NotificationTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(description, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String name;

  const ChatDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $name'),
      ),
      body: Center(
        child: Text('Chat content with $name'),
      ),
    );
  }
}