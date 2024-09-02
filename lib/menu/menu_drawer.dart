import 'package:achieverse/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:achieverse/menu/my_dashboard.dart';
import 'package:achieverse/menu/community_hub.dart';
import 'package:achieverse/menu/messaging.dart';
import 'package:achieverse/menu/my_courses.dart';
import 'package:achieverse/menu/my_games.dart';
import 'package:achieverse/menu/my_goals.dart';
import 'package:achieverse/menu/my_rewards.dart';
import 'package:achieverse/menu/career_compass.dart';
import 'package:achieverse/menu/my_networking.dart';
import 'package:achieverse/home_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:achieverse/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 24.0 : 32.0,
                      backgroundImage: const AssetImage('assets/images/profile_image.png'), // Update with actual path
                    ),
                    SizedBox(width: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 8.0 : 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shayden',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 16.0 : 18.0,
                            ),
                          ),
                          Text(
                            'Software Engineer',
                            style: TextStyle(
                              fontSize: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 12.0 : 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildListTile(
                context,
                Icons.home,
                'Home',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.dashboard,
                'My Dashboard',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDashboard(
                              userName: 'Shayden',
                              jobTitle: 'Software Engineer',
                              location: 'Cape Town, South Africa',
                              profileImageUrl: 'https://example.com/profile.jpg',
                              backgroundImageUrl: 'https://example.com/background.jpg',
                            )),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.group,
                'Community Hub',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  CommunityHub()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.message,
                'Messaging',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Messaging()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.book,
                'My Courses',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyCourses()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.flag,
                'My Goals',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyGoals()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.star,
                'My Rewards',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyRewards()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.games,
                'My Games',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyGames()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.compare,
                'Career Compass',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CareerCompass()),
                  );
                },
                sizingInformation,
              ),
              _buildListTile(
                context,
                Icons.people,
                'My Networking',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyNetworking()),
                  );
                },
                sizingInformation,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
    SizingInformation sizingInformation,
  ) {
    return ListTile(
      leading: Icon(icon, size: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 20.0 : 24.0),
      title: Text(
        title,
        style: TextStyle(fontSize: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 14.0 : 16.0),
      ),
      onTap: onTap,
    );
  }
}
