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

class MyNetworking extends StatelessWidget {
  const MyNetworking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserProfileWidget(),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return DesktopNetworkingLayout();
          } else if (constraints.maxWidth > 600) {
            return TabletNetworkingLayout();
          } else {
            return MobileNetworkingLayout();
          }
        },
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Shayden', style: Theme.of(context).textTheme.titleMedium),
            Text('Software Developer', style: Theme.of(context).textTheme.bodySmall),
            Text('Cape Town, SA', style: Theme.of(context).textTheme.bodySmall),
            Text('Looking for: Junior Dev Role', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user_profile.jpg'),
          radius: 20,
        ),
      ],
    );
  }
}

class DesktopNetworkingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: JobListings(),
        ),
        Expanded(
          flex: 1,
          child: PeopleHiring(),
        ),
      ],
    );
  }
}

class TabletNetworkingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: JobListings(),
        ),
        Expanded(
          child: PeopleHiring(),
        ),
      ],
    );
  }
}

class MobileNetworkingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        JobListings(),
        PeopleHiring(),
      ],
    );
  }
}

class JobListings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Job Listings', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return JobListingItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobListingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/company_logo.jpg'),
      ),
      title: const Text('Junior Flutter Developer'),
      subtitle: const Text('TechCorp Inc. • Cape Town, SA'),
      trailing: ElevatedButton(
        onPressed: () {},
        child: const Text('Apply'),
      ),
    );
  }
}

class PeopleHiring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('People Hiring', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PeopleHiringItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PeopleHiringItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/recruiter.jpg'),
      ),
      title: const Text('Jane Smith'),
      subtitle: const Text('Tech Recruiter at StartupX'),
      trailing: ElevatedButton(
        onPressed: () {},
        child: const Text('Connect'),
      ),
    );
  }
}
