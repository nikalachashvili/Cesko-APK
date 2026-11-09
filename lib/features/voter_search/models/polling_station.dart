import 'package:flutter/foundation.dart';

@immutable
class PollingStation {
  const PollingStation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String address;
  final double latitude;
  final double longitude;
}
