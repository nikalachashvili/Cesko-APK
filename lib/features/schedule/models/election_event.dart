import 'package:flutter/foundation.dart';

@immutable
class ElectionEvent {
  const ElectionEvent({required this.dateTime, required this.title});

  final DateTime dateTime;
  final String title;
}
