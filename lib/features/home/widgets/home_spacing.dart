import 'package:flutter/material.dart';

/// Vertical spacing for the home layout. Short screens (e.g. iPhone SE) get
/// tighter padding so the whole page still fits without scrolling.
@immutable
class HomeSpacing {
  const HomeSpacing._({
    required this.gap,
    required this.cardHeader,
    required this.tile,
    required this.link,
    required this.band,
  });

  static const _regular = HomeSpacing._(
    gap: 16,
    cardHeader: 16,
    tile: 14,
    link: 16,
    band: 8,
  );

  static const _compact = HomeSpacing._(
    gap: 10,
    cardHeader: 10,
    tile: 8,
    link: 10,
    band: 6,
  );

  static HomeSpacing of(BuildContext context) =>
      MediaQuery.sizeOf(context).height < 700 ? _compact : _regular;

  /// Page padding and the gaps between the card, button, divider and banner.
  final double gap;

  /// Vertical padding of the administration card's green title bar.
  final double cardHeader;

  /// Vertical padding of each institution row.
  final double tile;

  /// Vertical padding of the commission links.
  final double link;

  /// Height of the grey separator bands inside the card.
  final double band;
}
