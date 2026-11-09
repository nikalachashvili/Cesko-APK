import 'package:flutter/material.dart';

/// Green toggle that shows / hides the voters registered at the address.
class VotersAtAddressButton extends StatelessWidget {
  const VotersAtAddressButton({
    super.key,
    required this.expanded,
    required this.onPressed,
  });

  final bool expanded;
  final VoidCallback onPressed;

  static const _chevronSize = 28.0;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      expanded: expanded,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.fromLTRB(16 + _chevronSize, 12, 16, 12),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'ამ მისამართზე რეგისტრირებულ ამომრჩეველთა სია',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, height: 1.4),
              ),
            ),
            AnimatedRotation(
              turns: expanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.keyboard_arrow_down, size: _chevronSize),
            ),
          ],
        ),
      ),
    );
  }
}
