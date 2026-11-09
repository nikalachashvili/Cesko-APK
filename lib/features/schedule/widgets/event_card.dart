import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/utils/georgian_date.dart';
import 'package:voters/features/schedule/models/election_event.dart';

/// White card showing one event's time and description.
class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final ElectionEvent event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'საათი ${GeorgianDate.time(event.dateTime)}',
            style: const TextStyle(color: AppColors.green, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            event.title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
