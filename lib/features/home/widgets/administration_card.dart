import 'package:flutter/material.dart';
import 'package:voters/core/constants/app_images.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/features/home/widgets/commission_link.dart';
import 'package:voters/features/home/widgets/home_spacing.dart';
import 'package:voters/features/home/widgets/institution_tile.dart';

/// "Election administration system" card: green title bar, the two
/// institution rows and the commission links.
class AdministrationCard extends StatelessWidget {
  const AdministrationCard({super.key, required this.spacing});

  final HomeSpacing spacing;

  static const _radius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: _radius,
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: _radius,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: AppColors.green,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: spacing.cardHeader,
                ),
                child: Semantics(
                  header: true,
                  child: const Text(
                    'საქართველოს საარჩევნო ადმინისტრაციის სისტემა',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
              InstitutionTile(
                logo: AppImages.cecLogo,
                title: 'საქართველოს საარჩევნო ადმინისტრაცია და მისი აპარატი',
                verticalPadding: spacing.tile,
                // TODO: open the election administration page.
                onTap: () {},
              ),
              _Band(height: spacing.band),
              InstitutionTile(
                logo: AppImages.ajaraLogo,
                title: 'აჭარის ავტონომიური რესპუბლიკის უმაღლესი საარჩევნო კომისია და მისი აპარატი',
                verticalPadding: spacing.tile,
                // TODO: open the Ajara supreme election commission page.
                onTap: () {},
              ),
              _Band(height: spacing.band),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CommissionLink(
                        title: 'საოლქო საარჩევნო კომისიები',
                        verticalPadding: spacing.link,
                        // TODO: open district election commissions.
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: CommissionLink(
                        title: 'საუბნო საარჩევნო კომისიები',
                        verticalPadding: spacing.link,
                        // TODO: open precinct election commissions.
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Grey separator between the card's rows.
class _Band extends StatelessWidget {
  const _Band({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const ColoredBox(color: AppColors.band),
    );
  }
}
