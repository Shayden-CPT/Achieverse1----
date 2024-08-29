import 'package:achieverse/menu/my_courses.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'widgets/header_section.dart';
import 'widgets/stats_section.dart';
import 'widgets/popular_courses_section.dart';
import 'widgets/info_section.dart';
import 'widgets/top_categories_section.dart';
import 'widgets/mentors_section.dart';
import 'widgets/testimonials_section.dart';
import 'widgets/blogs_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/dev_feed_widget.dart';
import 'widgets/article_widget.dart';
import 'menu/menu_drawer.dart';

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
            image: AssetImage('assets/images/background.jpg'),
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
                        imagePath: '',
                      ),
                      const StatsSection(
                        imagePath: '',
                      ),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const PopularCoursesSection(
                        imagePath: '',
                      ),
                      const InfoSection(
                        imagePath: '',
                      ),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const TopCategoriesSection(
                        imagePath: '',
                      ),
                      const MentorsSection(
                        imagePath: '',
                      ),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const TestimonialsSection(
                        imagePath: '',
                      ),
                      const BlogsSection(
                        imagePath: '',
                      ),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const DevFeedWidget(
                        topic: 'Flutter',
                        imagePath: '',
                      ),
                      const DevFeedWidget(
                        topic: 'React JS',
                        imagePath: '',
                      ),
                    ],
                  ),
                  _responsiveRow(
                    sizingInformation,
                    [
                      const ArticleWidget(
                        topic: 'HTML/CSS',
                        imagePath: '',
                      ),
                      const ArticleWidget(
                        topic: 'C#',
                        imagePath: '',
                      ),
                    ],
                  ),
                  const FooterSection(
                    imagePath: '',
                  ),
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
              (child) => Flexible(
                fit: FlexFit.tight,
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
