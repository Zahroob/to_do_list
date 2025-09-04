import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
            ),
          ),
        ),
        child,
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            width: 300, 
            height: 300,
            fit: BoxFit.cover,
            'assets/image/shape.png',
          ),
        ),
      ],
    );
  }
}
