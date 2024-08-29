import 'package:flutter/material.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';

class CareerCompass extends StatelessWidget {
  const CareerCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Compass'),
        backgroundColor: Colors.blueAccent,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          _buildUserProfile(context),
          _buildMainContent(context),
          _buildSidebar(context),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (MediaQuery.of(context).size.width > 600)
            _buildUserProfile(context),
          const SizedBox(height: 24),
          _buildInDemandCareers(context),
          const SizedBox(height: 24),
          _buildCareerSuccessTips(context),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildExploreOtherCareers(context),
          const SizedBox(height: 24),
          _buildRecommendedResources(context),
        ],
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage('https://example.com/user-avatar.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Shayden',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Software Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              'Cape Town, SA',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Edit profile action
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInDemandCareers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'In-Demand Careers',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildCareerCard(
          'Data Scientist',
          'High demand in tech and finance sectors',
          Icons.analytics,
        ),
        _buildCareerCard(
          'UX Designer',
          'Growing need in software and product companies',
          Icons.design_services,
        ),
        _buildCareerCard(
          'Cybersecurity Specialist',
          'Critical role in protecting digital assets',
          Icons.security,
        ),
      ],
    );
  }

  Widget _buildCareerSuccessTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Career Success Tips',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildTipCard(
          'Continuous Learning',
          'Stay updated with industry trends and new technologies',
          Icons.school,
        ),
        _buildTipCard(
          'Networking',
          'Build and maintain professional relationships',
          Icons.people,
        ),
        _buildTipCard(
          'Soft Skills Development',
          'Enhance communication and leadership abilities',
          Icons.psychology,
        ),
        _buildTipCard(
          'Android Development',
          'Keep up with all things Google',
          Icons.android,
        ),
      ],
    );
  }

  Widget _buildExploreOtherCareers(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Other Careers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildCareerExploreItem('Web Developer', '5 connections'),
            _buildCareerExploreItem('Product Manager', '3 connections'),
            _buildCareerExploreItem('Data Analyst', '7 connections'),
            TextButton(
              onPressed: () {
                // View more careers action
              },
              child: const Text('View More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedResources(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommended Resources',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildResourceItem('10 Steps to Career Success', Icons.book),
            _buildResourceItem('Industry Networking Events', Icons.event),
            _buildResourceItem('Online Skill Courses', Icons.computer),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerCard(String title, String description, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to career details
        },
      ),
    );
  }

  Widget _buildTipCard(String title, String description, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.greenAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: () {
          // Show more details about the tip
        },
      ),
    );
  }

  Widget _buildCareerExploreItem(String career, String connections) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(career),
          Text(connections, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildResourceItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.orangeAccent),
      title: Text(title),
      onTap: () {
        // Open resource
      },
    );
  }
}
