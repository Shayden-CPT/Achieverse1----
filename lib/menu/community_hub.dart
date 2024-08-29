import 'package:flutter/material.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';

class CommunityHub extends StatelessWidget {
  const CommunityHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Hub'),
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
        Expanded(
          flex: 2,
          child: _buildMainContent(context),
        ),
        Expanded(
          flex: 1,
          child: _buildSidebar(context),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildMainContent(context),
        ),
        Expanded(
          flex: 2,
          child: _buildSidebar(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMainContent(context),
          _buildSidebar(context),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Image
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://example.com/header-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Welcome Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the Community Hub!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),

          // Message Section
          _buildMessageSection(context),

          // Comments Section
          _buildCommentsSection(context),

          // Forum Section
          _buildForumSection(context),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildUserProfile(context),
          _buildNotifications(context),
          _buildActiveUsers(context),
        ],
      ),
    );
  }

  Widget _buildMessageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Messages',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildMessageWithAvatar('User1', 'Hello everyone!'),
                  const SizedBox(height: 8),
                  _buildMessageWithAvatar('User2', 'Welcome to the hub!'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Comments',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildMessageWithAvatar('User3', 'This is a great community!'),
                  const SizedBox(height: 8),
                  _buildMessageWithAvatar('User4', 'Looking forward to connecting!'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForumSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Forum',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildForumTopic('Flutter Development'),
                  const SizedBox(height: 8),
                  _buildForumTopic('Community Events'),
                  const SizedBox(height: 8),
                  _buildForumTopic('Best Practices'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageWithAvatar(String username, String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://example.com/$username-avatar.jpg'),
          radius: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(message),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildForumTopic(String topic) {
    return ListTile(
      title: Text(topic),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to topic page
      },
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/current-user-avatar.jpg'),
            radius: 50,
          ),
          const SizedBox(height: 8),
          const Text('Current User', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {
              // Edit profile action
            },
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotifications(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notifications',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildNotificationItem('User5 liked your post'),
          _buildNotificationItem('New message from User6'),
          _buildNotificationItem('Community event tomorrow'),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String message) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://example.com/notification-avatar.jpg'),
        radius: 20,
      ),
      title: Text(message),
      onTap: () {
        // Handle notification tap
      },
    );
  }

  Widget _buildActiveUsers(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Users',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              10,
              (index) => CircleAvatar(
                backgroundImage: NetworkImage('https://example.com/user$index-avatar.jpg'),
                radius: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
