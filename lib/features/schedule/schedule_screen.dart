import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/widgets/green_header.dart';
import 'package:voters/features/schedule/models/election_event.dart';
import 'package:voters/features/schedule/widgets/calendar_strip.dart';
import 'package:voters/features/schedule/widgets/day_section.dart';

/// Event schedule: a horizontal day strip for the selected month and, below
/// it, every event from the selected day onward grouped by date.
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key, required this.events});

  final List<ElectionEvent> events;

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  static final _firstDate = DateTime(2020);
  static final _lastDate = DateTime(2035, 12, 31);

  late DateTime _selected = _initialDate();

  /// Start at the beginning of the month of the earliest event, or today.
  DateTime _initialDate() {
    if (widget.events.isEmpty) return DateUtils.dateOnly(DateTime.now());
    final earliest = widget.events
        .map((e) => e.dateTime)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    return DateTime(earliest.year, earliest.month);
  }

  List<MapEntry<DateTime, List<ElectionEvent>>> _eventsFromSelectedDay() {
    final upcoming =
        widget.events
            .where((e) => !DateUtils.dateOnly(e.dateTime).isBefore(_selected))
            .toList()
          ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final byDay = <DateTime, List<ElectionEvent>>{};
    for (final event in upcoming) {
      (byDay[DateUtils.dateOnly(event.dateTime)] ??= []).add(event);
    }
    return byDay.entries.toList();
  }

  void _select(DateTime day) => setState(() => _selected = day);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selected,
      firstDate: _firstDate,
      lastDate: _lastDate,
    );
    if (!mounted || picked == null) return;
    _select(DateUtils.dateOnly(picked));
  }

  @override
  Widget build(BuildContext context) {
    final groups = _eventsFromSelectedDay();

    return Column(
      children: [
        GreenHeader(
          title: 'ღონისძიებათა გრაფიკი',
          bottom: CalendarStrip(
            selected: _selected,
            onSelected: _select,
            onPickDate: _pickDate,
          ),
        ),
        Expanded(
          child: groups.isEmpty
              ? const Center(
                  child: Text(
                    'ღონისძიებები არ არის',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                )
              : ListView(
                  // Not primary: the list stays still while the events fit
                  // and only scrolls once there are more than fit on screen.
                  primary: false,
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  children: [
                    for (final group in groups)
                      DaySection(day: group.key, events: group.value),
                  ],
                ),
        ),
      ],
    );
  }
}
