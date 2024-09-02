import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple provider
final counterProvider = StateProvider<int>((ref) => 0);

class FooterSection extends StatelessWidget {
  final String imagePath;

  const FooterSection({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive text sizes
    double titleFontSize = screenWidth < 600 ? 24.0 : 36.0; // Mobile: 24, Tablet/Desktop: 36
    double bodyFontSize = screenWidth < 600 ? 14.0 : 16.0; // Mobile: 14, Tablet/Desktop: 16

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 16.0 : 32.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 16.0),
          Text(
            'Achieverse',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ensure text is readable on background image
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Contact us: +27 074 670 8097',
            style: TextStyle(fontSize: bodyFontSize, color: Colors.white),
          ),
          Text(
            'Email: www.redacademy.co.za',
            style: TextStyle(fontSize: bodyFontSize, color: Colors.white),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: [
              _buildFooterColumn('Menu', ['Home', 'Courses', 'About Us', 'Mentors', 'Blog']),
              _buildFooterColumn('Company', ['Support', 'Careers', 'Privacy Policy', 'Terms of Service']),
              _buildFooterColumn('Support', ['Help Center', 'FAQs', 'Contact Us']),
              _subscriptionSection(),
            ],
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          const Center(
            child: Text(
              '© 2024 Achieverse. All rights reserved.',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Made with '),
                Icon(Icons.favorite, color: Colors.red, size: 18),
                Text(' by Red Academy', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Text(
              'Powered by Flutter',
              style: TextStyle(color: Colors.white),
            ),
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
            color: Colors.white, // Ensure text is readable on background image
          ),
        ),
        const SizedBox(height: 8.0),
        ...items.map((item) => Text(
          item,
          style: const TextStyle(color: Colors.white),
        )),
      ],
    );
  }

  Widget _subscriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subscribe to our Newsletter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.white54),
              suffixIcon: ElevatedButton(
                onPressed: () {},
                child: const Text('Subscribe Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, // Change button color for better contrast
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
