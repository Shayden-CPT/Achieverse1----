import 'package:flutter/material.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/nav_bar.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key, required String imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;
    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 16.0),
          const Text(
            'Achieverse',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text('Contact us: +27 074 670 8097'),
          const Text('Email: www.redacademy.co.za'),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: [
              _buildFooterColumn('Menu', ['Home', 'Courses', 'About Us', 'Mentors', 'Blog']),
              _buildFooterColumn('Company', ['Support', 'Careers', 'Privacy Policy', 'Terms of Service']),
              _buildFooterColumn('Support', ['Help Center', 'FAQs', 'Contact Us']),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Subscribe to our Newsletter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        suffixIcon: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Subscribe Now'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          const Center(
            child: Text('© 2024 Achieverse. All rights reserved.'),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Made with '),
                Icon(Icons.favorite, color: Colors.red, size: 18),
                Text(' by Red Academy'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Text('Powered by Flutter'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        ...items.map((item) => Text(item)),
      ],
    );
  }
}