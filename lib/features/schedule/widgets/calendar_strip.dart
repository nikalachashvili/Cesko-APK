import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/utils/georgian_date.dart';
import 'package:voters/features/schedule/widgets/day_cell.dart';

/// Dark panel under the schedule header: month title, date-picker button and
/// a horizontally scrolling row of the selected month's days.
class CalendarStrip extends StatefulWidget {
  const CalendarStrip({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.onPickDate,
  });

  final DateTime selected;
  final ValueChanged<DateTime> onSelected;
  final VoidCallback onPickDate;

  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  static const _itemWidth = 42.0;
  static const _sidePadding = 12.0;

  final _controller = ScrollController();

  @override
  void didUpdateWidget(CalendarStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!DateUtils.isSameDay(oldWidget.selected, widget.selected)) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _ensureSelectedVisible(),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Scrolls the strip only when the selected day is (partly) out of view,
  /// e.g. after picking a date from the dialog.
  void _ensureSelectedVisible() {
    if (!mounted || !_controller.hasClients) return;
    final position = _controller.position;
    final index = widget.selected.day - 1;
    final start = index * _itemWidth;
    final end = (index + 1) * _itemWidth + 2 * _sidePadding;

    double? target;
    if (start < position.pixels) {
      target = start;
    } else if (end > position.pixels + position.viewportDimension) {
      target = end - position.viewportDimension;
    }
    if (target == null) return;

    _controller.animateTo(
      target.clamp(0, position.maxScrollExtent),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final month = widget.selected;
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    return Material(
      color: AppColors.dark,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      GeorgianDate.monthYear(month),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onPickDate,
                    tooltip: 'თარიღის არჩევა',
                    icon: const Icon(Icons.event_note, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 64,
              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
                itemExtent: _itemWidth,
                itemCount: daysInMonth,
                itemBuilder: (context, i) {
                  final day = DateTime(month.year, month.month, i + 1);
                  return DayCell(
                    day: day,
                    selected: DateUtils.isSameDay(day, widget.selected),
                    onTap: () => widget.onSelected(day),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
