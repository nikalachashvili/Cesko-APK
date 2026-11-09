import 'package:flutter/material.dart';
import 'package:voters/core/constants/app_images.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Illustrated "voter search" banner. Fills the height it is given, so the
/// home page can hand it whatever space is left on screen.
class VoterSearchCard extends StatelessWidget {
  const VoterSearchCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: Colors.white,
          child: Semantics(
            button: true,
            child: InkWell(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 72),
                      child: const _Illustration(),
                    ),
                  ),
                  Ink(
                    color: AppColors.green,
                    padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ამომრჩევლის ძიება',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Fills whatever height the card gives it. Anchored to the top so the phone
/// and magnifier stay visible; the bottom of the phone is what gets cropped,
/// as in the design.
///
/// The image sits in a `Positioned.fill` so it reports no intrinsic height of
/// its own — the page's fit-or-scroll check then only counts the card's
/// `minHeight`, not the image's natural size.
class _Illustration extends StatelessWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.voterSearch,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            excludeFromSemantics: true,
          ),
        ),
      ],
    );
  }
}
