import 'package:voters/features/voter_search/models/polling_station.dart';
import 'package:voters/features/voter_search/models/voter.dart';
import 'package:voters/features/voter_search/models/voter_search_result.dart';

/// Placeholder result until the search is backed by an API.
final mockSearchResult = VoterSearchResult(
  voter: _voter,
  pollingStation: const PollingStation(
    address: _address,
    latitude: 41.7151,
    longitude: 44.8271,
  ),
  votersAtAddress: [_voter],
);

const _address = 'თბილისი, ბოგდან ხმელნიცკის ქ. N2, ბ. 93';

final _voter = Voter(
  firstName: 'ნიკა',
  lastName: 'ლაჩაშვილი',
  birthDate: DateTime(1970),
  district: '06',
  precinct: '06',
  listNumber: 266,
  precinctType: 'ელექტრონული',
  legalAddress: _address,
  actualAddress: _address,
  actualStatus: 'საკონსულო აღრიცხვა იმყოფება უცხოეთში',
);
