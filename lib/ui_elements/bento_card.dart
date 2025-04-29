import 'dart:ui';

import 'package:flutter/material.dart';

class BentoCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final LinearGradient gradient;
  final double size;
  final double borderRadius;

  const BentoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.size,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Background blurred container
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),

        /// Border container
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius + 4),
          ),
        ),

        /// Foreground container
        Container(
          width: size - 8,
          height: size - 8,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF181818),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const Spacer(),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
