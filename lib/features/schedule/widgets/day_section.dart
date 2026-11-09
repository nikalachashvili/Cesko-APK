import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/utils/georgian_date.dart';
import 'package:voters/features/schedule/models/election_event.dart';
import 'package:voters/features/schedule/widgets/event_card.dart';

/// A day heading (e.g. "ორშაბათი, 8 ივლისი") followed by that day's events.
class DaySection extends StatelessWidget {
  const DaySection({super.key, required this.day, required this.events});

  final DateTime day;
  final List<ElectionEvent> events;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: Text(
              GeorgianDate.dayHeading(day),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (final event in events) ...[
            const SizedBox(height: 12),
            EventCard(event: event),
          ],
        ],
      ),
    );
  }
}
