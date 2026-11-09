import 'package:flutter/foundation.dart';

@immutable
class Voter {
  const Voter({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.district,
    required this.precinct,
    required this.listNumber,
    required this.precinctType,
    required this.legalAddress,
    required this.actualAddress,
    required this.actualStatus,
  });

  final String firstName;
  final String lastName;
  final DateTime birthDate;

  /// Election district number (ოლქი), e.g. "06".
  final String district;

  /// Precinct number (უბანი), e.g. "06".
  final String precinct;

  /// Sequence number in the unified voter list.
  final int listNumber;

  /// Polling station type, e.g. "ელექტრონული".
  final String precinctType;

  final String legalAddress;
  final String actualAddress;
  final String actualStatus;

  String get fullName => '$firstName $lastName';
}
