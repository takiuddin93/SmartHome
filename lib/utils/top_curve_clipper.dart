import 'package:flutter/material.dart';

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0, size.height * 0.095);
    path.quadraticBezierTo(size.width * 0.075, size.height * 0.155, size.width * 0.1, size.height * 0.155);
    path.lineTo(size.width * 0.9, size.height * 0.155);
    path.quadraticBezierTo(size.width * 0.925, size.height * 0.155, size.width, size.height * 0.095);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
