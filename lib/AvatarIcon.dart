import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({
    super.key,
    required this.image,
    required this.imageRadius,
  });

  final String image;
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageRadius,
      width: imageRadius,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
        color: const Color.fromRGBO(48, 48, 48, 0.85),
        shape: BoxShape.circle,
      ),
    );
  }
}
