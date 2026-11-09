import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/features/home/widgets/administration_card.dart';
import 'package:voters/features/home/widgets/home_spacing.dart';
import 'package:voters/features/home/widgets/voter_search_card.dart';
import 'package:voters/features/voter_search/voter_search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = HomeSpacing.of(context);

    return Column(
      children: [
        Container(
          height: MediaQuery.paddingOf(context).top,
          color: AppColors.green,
        ),
        Expanded(
          child: CustomScrollView(
            primary: false,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: spacing.gap,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AdministrationCard(spacing: spacing),
                      SizedBox(height: spacing.gap),
                      FilledButton(
                        onPressed: () {},
                        child: const Text(
                          'ინფორმაცია საზღვარგარეთ მყოფი ამომრჩევლებისთვის',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: spacing.gap),
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                      ),
                      Expanded(
                        child: VoterSearchCard(
                          onTap: () =>
                              Navigator.of(context)
                                  .push(VoterSearchScreen.route()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
