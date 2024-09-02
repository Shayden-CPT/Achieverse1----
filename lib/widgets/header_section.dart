import 'package:achieverse/menu/menu_drawer.dart';
import 'package:achieverse/menu/my_courses.dart';
import 'package:achieverse/widgets/blogs_section.dart';
import 'package:achieverse/widgets/dev_feed_widget.dart';
import 'package:achieverse/widgets/footer_section.dart';
import 'package:achieverse/widgets/info_section.dart';
import 'package:achieverse/widgets/mentors_section.dart';
import 'package:achieverse/widgets/popular_courses_section.dart';
import 'package:achieverse/widgets/stats_section.dart';
import 'package:achieverse/widgets/testimonials_section.dart';
import 'package:achieverse/widgets/top_categories_section.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Achieverse'),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/leading_frameworks.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: sizingInformation.deviceScreenType ==
                        DeviceScreenType.mobile
                    ? 16.0
                    : 32.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _responsiveRow(
                    sizingInformation,
                    [
                      const HeaderSection(
                          imagePath: 'assets/images/flutter_center.jpg'),
                      const StatsSection(imagePath: 'assets/images/stats.jpg'),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const PopularCoursesSection(
                          imagePath: 'assets/images/courses.jpg'),
                      const InfoSection(imagePath: 'assets/images/info.jpg'),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const TopCategoriesSection(
                          imagePath: 'assets/images/categories.jpg'),
                      const MentorsSection(
                          imagePath: 'assets/images/mentors.jpg'),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const TestimonialsSection(
                          imagePath: 'assets/images/testimonials.jpg'),
                      const BlogsSection(imagePath: 'assets/images/blogs.jpg'),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const DevFeedWidget(
                          topic: 'Flutter',
                          imagePath: 'assets/images/dev_feed_flutter.jpg'),
                      const DevFeedWidget(
                          topic: 'React JS',
                          imagePath: 'assets/images/dev_feed_react.jpg'),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const ArticleWidget(
                          topic: 'HTML/CSS',
                          imagePath: 'assets/images/article_html_css.jpg'),
                      const ArticleWidget(
                          topic: 'C#',
                          imagePath: 'assets/images/article_csharp.jpg'),
                    ],
                  ),
                  const FooterSection(imagePath: 'assets/images/footer.jpg'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _responsiveRow(
      SizingInformation sizingInformation, List<Widget> children) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
            .map((child) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: child,
                ))
            .toList(),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children
            .map(
              (child) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                ),
              ),
            )
            .toList(),
      );
    }
  }
}
