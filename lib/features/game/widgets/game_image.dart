import 'package:flutter/material.dart';

/// Decorative game preview image that fills (and crops to) its box.
class GameImage extends StatelessWidget {
  const GameImage(this.asset, {super.key});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(asset, fit: BoxFit.cover, excludeFromSemantics: true),
    );
  }
}
