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
import 'package:cached_network_image/cached_network_image.dart';
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
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? 16.0 : 32.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lazyLoadWidget(
                    _responsiveWidget(
                      sizingInformation,
                      const HeaderSection(imagePath: 'assets/images/header_image.jpg'),
                      const StatsSection(imagePath: 'assets/images/stats_image.jpg'),
                    ),
                  ),
                  _lazyLoadWidget(
                    _responsiveWidget(
                      sizingInformation,
                      const PopularCoursesSection(imagePath: 'assets/images/popular_courses_image.jpg'),
                      const InfoSection(imagePath: 'assets/images/info_image.jpg'),
                    ),
                  ),
                  _lazyLoadWidget(
                    _responsiveWidget(
                      sizingInformation,
                      const TopCategoriesSection(imagePath: 'assets/images/top_categories_image.jpg'),
                      const MentorsSection(imagePath: 'assets/images/mentors_image.jpg'),
                    ),
                  ),
                  _lazyLoadWidget(
                    _responsiveWidget(
                      sizingInformation,
                      const TestimonialsSection(imagePath: 'assets/images/testimonials_image.jpg'),
                      const BlogsSection(imagePath: 'assets/images/blogs_image.jpg'),
                    ),
                  ),
                  _lazyLoadWidget(
                    _responsiveWidget(
                      sizingInformation,
                      const DevFeedWidget(topic: 'Flutter', imagePath: 'assets/images/flutter_image.jpg'),
                      const DevFeedWidget(topic: 'React JS', imagePath: 'assets/images/react_js_image.jpg'),
                    ),
                  ),
                  _lazyLoadWidget(
                    _responsiveWidget(
                      sizingInformation,
                      const ArticleWidget(topic: 'HTML/CSS', imagePath: 'assets/images/html_css_image.jpg'),
                      const ArticleWidget(topic: 'C#', imagePath: 'assets/images/csharp_image.jpg'),
                    ),
                  ),
                  _lazyLoadWidget(
                    const FooterSection(imagePath: 'assets/images/footer_image.jpg'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _lazyLoadWidget(Widget widget) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500), () => widget),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data as Widget;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _responsiveWidget(SizingInformation sizingInformation, Widget mobileWidget, Widget desktopWidget) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [mobileWidget],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(fit: FlexFit.tight, child: Padding(padding: const EdgeInsets.all(8.0), child: mobileWidget)),
          Flexible(fit: FlexFit.tight, child: Padding(padding: const EdgeInsets.all(8.0), child: desktopWidget)),
        ],
      );
    }
  }
}
