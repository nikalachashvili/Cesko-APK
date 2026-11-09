import 'package:flutter_test/flutter_test.dart';
import 'package:voters/features/voter_search/utils/mobile_number_formatter.dart';
import 'package:voters/features/voter_search/utils/voter_search_validators.dart';

void main() {
  group('MobileNumberFormatter', () {
    String format(String input) => const MobileNumberFormatter()
        .formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: input))
        .text;

    test('groups digits as 5##-##-##-##', () {
      expect(format('5'), '5');
      expect(format('599'), '599');
      expect(format('5991'), '599-1');
      expect(format('599123456'), '599-12-34-56');
    });

    test('drops non-digits and caps at 9 digits', () {
      expect(format('599 12a34-5678'), '599-12-34-56');
    });

    test('never leaves a trailing dash after deleting a digit', () {
      expect(format('599-'), '599');
    });
  });

  group('VoterSearchValidators', () {
    test('personal number needs exactly 11 digits', () {
      expect(VoterSearchValidators.personalNumber(''), isNotNull);
      expect(VoterSearchValidators.personalNumber('1234567890'), isNotNull);
      expect(VoterSearchValidators.personalNumber('01001012345'), isNull);
    });

    test('surname must not be blank', () {
      expect(VoterSearchValidators.surname('   '), isNotNull);
      expect(VoterSearchValidators.surname('ბერიძე'), isNull);
    });

    test('mobile must be 9 digits starting with 5', () {
      expect(VoterSearchValidators.mobile(''), isNotNull);
      expect(VoterSearchValidators.mobile('599-12-34'), isNotNull);
      expect(VoterSearchValidators.mobile('499-12-34-56'), isNotNull);
      expect(VoterSearchValidators.mobile('599-12-34-56'), isNull);
    });
  });
}
