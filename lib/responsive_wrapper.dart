import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:achieverse/network_service.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return _ResponsiveLayout(
          child: child,
          sizingInformation: sizingInformation,
        );
      },
    );
  }
}

class _ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final SizingInformation sizingInformation;

  const _ResponsiveLayout({required this.child, required this.sizingInformation});

  @override
  Widget build(BuildContext context) {
    // Adapt layout based on the device screen type
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        // You can use this to change the text scale factor or other metrics if needed
        textScaleFactor: _getTextScaleFactor(sizingInformation),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Example of adjusting layout based on screen size
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: _getWidth(sizingInformation),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }

  double _getWidth(SizingInformation sizingInformation) {
    // Adjust width based on device type
    if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      return double.infinity; // Full width for mobile
    } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
      return 600.0; // Example width for tablets
    } else {
      return 1200.0; // Example width for desktops
    }
  }

  double _getTextScaleFactor(SizingInformation sizingInformation) {
    // Adjust text scale factor based on device type
    if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      return 1.0;
    } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
      return 1.2;
    } else {
      return 1.5;
    }
  }
}
