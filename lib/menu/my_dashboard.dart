import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/header_section.dart';
import 'package:achieverse/widgets/nav_bar.dart';
import 'package:achieverse/menu/menu_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class MyDashboard extends StatelessWidget {
  final String userName;
  final String jobTitle;
  final String location;
  final String profileImageUrl;
  final String backgroundImageUrl;
  final Color primaryColor;
  final Color secondaryColor;

  const MyDashboard({
    super.key,
    required this.userName,
    required this.jobTitle,
    required this.location,
    required this.profileImageUrl,
    required this.backgroundImageUrl,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dashboard'),
        backgroundColor: primaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(backgroundImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildTechnologyUsage(),
                    const SizedBox(height: 24),
                    _buildResponsiveLayout([
                      _buildUserProfile(),
                      _buildProjectOverview(),
                      _buildTaskManagement(),
                    ]),
                    const SizedBox(height: 24),
                    _buildResponsiveLayout([
                      _buildCodeRepository(),
                      _buildIDEUsage(),
                      _buildDeviceTesting(),
                      _buildBugTracking(),
                    ]),
                    const SizedBox(height: 24),
                    _buildResponsiveLayout([
                      _buildTestCoverage(),
                      _buildCalendar(),
                      _buildTimeTracking(),
                    ]),
                    const SizedBox(height: 24),
                    _buildPerformanceMetrics(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveLayout(List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          // Desktop layout
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
                .map((child) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: child,
                      ),
                    ))
                .toList(),
          );
        } else if (constraints.maxWidth > 800) {
          // Tablet layout
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: children
                .map((child) => SizedBox(
                      width: (constraints.maxWidth - 32) / 2,
                      child: child,
                    ))
                .toList(),
          );
        } else {
          // Mobile layout
          return Column(
            children: children
                .map((child) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: child,
                    ))
                .toList(),
          );
        }
      },
    );
  }

  Widget _buildTechnologyUsage() {
    return _buildCard(
      'Technology Usage',
      SizedBox(
        height: 300,
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                  value: 35, title: 'Flutter', color: Colors.blue),
              PieChartSectionData(
                  value: 25, title: 'ReactJS', color: Colors.green),
              PieChartSectionData(
                  value: 15, title: 'NextJS', color: Colors.red),
              PieChartSectionData(
                  value: 10, title: 'HTML5', color: Colors.orange),
              PieChartSectionData(
                  value: 5, title: 'CSS3', color: Colors.purple),
              PieChartSectionData(
                  value: 5, title: 'JavaScript', color: Colors.yellow),
              PieChartSectionData(
                  value: 5,
                  title: 'C#',
                  color: const Color.fromARGB(255, 217, 132, 5)),
            ],
          ),
        ),
      ),
      color: Colors.white,
    );
  }

  Widget _buildUserProfile() {
    return _buildCard(
      'User Profile',
      Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: CachedNetworkImageProvider(profileImageUrl),
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(jobTitle),
          Text(location),
        ],
      ),
      imagePath: 'assets/images/profile_bg.jpg',
      color: Colors.purple,
    );
  }

  Widget _buildProjectOverview() {
    return _buildCard(
      'Project Overview',
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Project Name: Flutter Dashboard'),
          Text(
              'Start Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}'),
          Text(
              'End Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 30)))}'),
          const Text('Status: In Progress'),
          const Text(
              'Description: Developing a responsive dashboard for front-end developers.'),
        ],
      ),
      imagePath: 'assets/images/project_bg.jpg',
      color: Colors.green,
    );
  }

  Widget _buildTaskManagement() {
    return _buildCard(
      'Task Management',
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('To-Do:'),
          _buildTaskItem('Implement user profile section', Colors.red),
          _buildTaskItem('Add responsiveness to dashboard', Colors.orange),
          const Text('In Progress:'),
          _buildTaskItem('Create technology usage chart', Colors.yellow),
          const Text('Completed:'),
          _buildTaskItem('Set up project structure', Colors.green),
        ],
      ),
      imagePath: 'assets/images/task_bg.jpg',
      color: Colors.blue,
    );
  }

  Widget _buildTaskItem(String task, Color priorityColor) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: priorityColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(task)),
      ],
    );
  }

  Widget _buildCodeRepository() {
    return _buildCard(
      'Code Repository',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Repository: github.com/user/flutter-dashboard'),
          Text('Branches: 3'),
          Text('Latest Commit: Update README.md'),
          Text('Pull Requests: 2 open'),
        ],
      ),
      imagePath: 'assets/images/code_bg.jpg',
      color: Colors.orange,
    );
  }

  Widget _buildIDEUsage() {
    return _buildCard(
      'IDE Usage',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('VS Code: 70%'),
          Text('Android Studio: 30%'),
        ],
      ),
      imagePath: 'assets/images/ide_bg.jpg',
      color: Colors.teal,
    );
  }

  Widget _buildDeviceTesting() {
    return _buildCard(
      'Device Testing',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Devices: 5'),
          Text('Most Used: iPhone 12, Pixel 4'),
          Text('OS Versions: iOS 14.5, Android 11'),
        ],
      ),
      imagePath: 'assets/images/device_bg.jpg',
      color: Colors.indigo,
    );
  }

  Widget _buildBugTracking() {
    return _buildCard(
      'Bug Tracking',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Open Bugs: 7'),
          Text('Closed Bugs: 23'),
          Text('Critical: 1, High: 3, Medium: 2, Low: 1'),
          Text('Avg. Resolution Time: 2.5 days'),
        ],
      ),
      imagePath: 'assets/images/bug_bg.jpg',
      color: Colors.red,
    );
  }

  Widget _buildTestCoverage() {
    return _buildCard(
      'Test Coverage',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Unit Tests: 85%'),
          Text('Integration Tests: 70%'),
          Text('E2E Tests: 60%'),
          Text('Overall Coverage: 75%'),
        ],
      ),
      imagePath: 'assets/images/test_bg.jpg',
      color: Colors.amber,
    );
  }

  Widget _buildCalendar() {
    return _buildCard(
      'Calendar',
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Next Deadline: ${DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7)))}'),
          const Text('Team Meeting: Every Monday at 10:00 AM'),
          const Text('Code Review: Thursdays at 2:00 PM'),
        ],
      ),
      imagePath: 'assets/images/calendar_bg.jpg',
      color: Colors.deepPurple,
    );
  }

  Widget _buildTimeTracking() {
    return _buildCard(
      'Time Tracking',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today: 6h 30m'),
          Text('This Week: 32h 15m'),
          Text('This Month: 140h 45m'),
        ],
      ),
      imagePath: 'assets/images/time_bg.jpg',
      color: Colors.brown,
    );
  }

  Widget _buildPerformanceMetrics() {
    return _buildCard(
      'Performance Metrics',
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Avg. Load Time: 1.2s'),
          Text('Code Complexity: Low'),
          Text('Maintainability: High'),
        ],
      ),
      imagePath: 'assets/images/performance_bg.jpg',
      color: Colors.cyan,
    );
  }

  Widget _buildCard(String title, Widget content,
      {String? imagePath, Color? color}) {
    return Card(
      color: color ?? secondaryColor.withOpacity(0.1),
      child: Container(
        decoration: imagePath != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.dstATop,
                  ),
                ),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: imagePath != null ? Colors.white : primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              DefaultTextStyle(
                style: TextStyle(
                  color: imagePath != null ? Colors.white : Colors.black,
                ),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
