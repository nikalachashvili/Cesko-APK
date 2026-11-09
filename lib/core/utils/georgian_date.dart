/// Georgian date labels used by the schedule screen.
abstract final class GeorgianDate {
  static const _months = [
    'იანვარი',
    'თებერვალი',
    'მარტი',
    'აპრილი',
    'მაისი',
    'ივნისი',
    'ივლისი',
    'აგვისტო',
    'სექტემბერი',
    'ოქტომბერი',
    'ნოემბერი',
    'დეკემბერი',
  ];

  static const _weekdays = [
    'ორშაბათი',
    'სამშაბათი',
    'ოთხშაბათი',
    'ხუთშაბათი',
    'პარასკევი',
    'შაბათი',
    'კვირა',
  ];

  static const _weekdaysShort = [
    'ორშ',
    'სამ',
    'ოთხ',
    'ხუთ',
    'პარ',
    'შაბ',
    'კვი',
  ];

  /// e.g. "ივლისი 2024".
  static String monthYear(DateTime d) => '${_months[d.month - 1]} ${d.year}';

  /// e.g. "ორშაბათი, 8 ივლისი".
  static String dayHeading(DateTime d) =>
      '${_weekdays[d.weekday - 1]}, ${d.day} ${_months[d.month - 1]}';

  /// e.g. "ორშ".
  static String weekdayShort(DateTime d) => _weekdaysShort[d.weekday - 1];

  /// e.g. "15:00".
  static String time(DateTime d) => '${_two(d.hour)}:${_two(d.minute)}';

  /// e.g. "01/01/1970".
  static String numeric(DateTime d) =>
      '${_two(d.day)}/${_two(d.month)}/${d.year}';

  static String _two(int n) => n.toString().padLeft(2, '0');
}
