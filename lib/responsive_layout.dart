import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine which layout to use based on screen width
    if (screenWidth < 380) {
      return mobileBody; // Mobile layout
    } else if (screenWidth < 1200) {
      return tabletBody; // Tablet layout
    } else {
      return desktopBody; // Desktop layout
    }
  }
}
