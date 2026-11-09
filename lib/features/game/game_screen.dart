import 'package:flutter/material.dart';
import 'package:voters/core/constants/app_images.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/widgets/green_header.dart';
import 'package:voters/features/game/widgets/game_image.dart';

/// Fixed, non-scrolling layout: the three image rows share the height left
/// after the header and button, in proportion to their natural heights.
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GreenHeader(title: 'თამაში'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  flex: 50,
                  child: GameImage(AppImages.gamePollingStation),
                ),
                const SizedBox(height: 16),
                const Expanded(
                  flex: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: GameImage(AppImages.gameMale)),
                      SizedBox(width: 24),
                      Expanded(child: GameImage(AppImages.gameFemale)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Expanded(
                  flex: 46,
                  child: GameImage(AppImages.gameVotingQueue),
                ),
                const SizedBox(height: 28),
                FilledButton(
                  // TODO: start the game.
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    elevation: 6,
                    shadowColor: AppColors.green.withValues(alpha: 0.5),
                  ),
                  child: const Text('თამაშის დაწყება'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
