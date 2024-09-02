import 'package:flutter/material.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class CommunityHub extends StatelessWidget {
  const CommunityHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Hub'),
        backgroundColor: Colors.tealAccent,
      ),
      drawer: const MenuDrawer(),
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
          _buildHeaderImage(),
          const SizedBox(height: 16),

          // Welcome Text
          _buildWelcomeText(context),

          // Message Section
          _lazyLoadWidget(_buildMessageSection(context)),

          // Comments Section
          _lazyLoadWidget(_buildCommentsSection(context)),

          // Forum Section
          _lazyLoadWidget(_buildForumSection(context)),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _lazyLoadWidget(_buildUserProfile(context)),
          _lazyLoadWidget(_buildNotifications(context)),
          _lazyLoadWidget(_buildActiveUsers(context)),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return CachedNetworkImage(
      imageUrl: 'https://example.com/header-image.jpg',
      imageBuilder: (context, imageProvider) => Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const SizedBox(
        height: 200,
        child: Center(child: Icon(Icons.error)),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Welcome to the Community Hub!',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
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
        CachedNetworkImage(
          imageUrl: 'https://example.com/$username-avatar.jpg',
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 20,
          ),
          placeholder: (context, url) => const CircleAvatar(
            radius: 20,
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 20,
            child: Icon(Icons.error),
          ),
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
          CachedNetworkImage(
            imageUrl: 'https://example.com/current-user-avatar.jpg',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: 50,
            ),
            placeholder: (context, url) => const CircleAvatar(
              radius: 50,
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 50,
              child: Icon(Icons.error),
            ),
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
      leading: CachedNetworkImage(
        imageUrl: 'https://example.com/notification-avatar.jpg',
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 20,
        ),
        placeholder: (context, url) => const CircleAvatar(
          radius: 20,
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const CircleAvatar(
          radius: 20,
          child: Icon(Icons.error),
        ),
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
              (index) => CachedNetworkImage(
                imageUrl: 'https://example.com/user$index-avatar.jpg',
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 20,
                ),
                placeholder: (context, url) => const CircleAvatar(
                  radius: 20,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lazyLoadWidget(Widget widget) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500), () => widget),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(height: 200, child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return snapshot.data!;
        }
      },
    );
  }
}
