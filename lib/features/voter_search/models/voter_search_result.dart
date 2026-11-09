import 'package:flutter/foundation.dart';
import 'package:voters/features/voter_search/models/polling_station.dart';
import 'package:voters/features/voter_search/models/voter.dart';

@immutable
class VoterSearchResult {
  const VoterSearchResult({
    required this.voter,
    required this.pollingStation,
    required this.votersAtAddress,
  });

  final Voter voter;
  final PollingStation pollingStation;

  /// Everyone registered at the voter's address.
  final List<Voter> votersAtAddress;
}
