import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double bulgeRadius = 30.0; // Radius of the bulge

    // Start from the top-left corner
    path.lineTo(0, size.height - bulgeRadius);

    // Create the bulge at the bottom
    path.arcToPoint(
      Offset(bulgeRadius, size.height),
      radius: Radius.circular(bulgeRadius),
      clockwise: false,
    );

    // Draw the bottom-right curve
    path.lineTo(size.width - bulgeRadius, size.height);

    // Create the bulge on the bottom-right corner
    path.arcToPoint(
      Offset(size.width, size.height - bulgeRadius),
      radius: Radius.circular(bulgeRadius),
      clockwise: false,
    );

    // Finish by drawing the top-right and top-left curves
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
