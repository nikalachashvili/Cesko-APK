/// Form validators for the voter search fields. Each returns an error message
/// in Georgian, or `null` when the value is valid.
abstract final class VoterSearchValidators {
  static final _personalNumber = RegExp(r'^\d{11}$');
  static final _mobile = RegExp(r'^5\d{8}$');

  static String? personalNumber(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'შეიყვანეთ პირადი ნომერი';
    if (!_personalNumber.hasMatch(input)) {
      return 'პირადი ნომერი უნდა შედგებოდეს 11 ციფრისგან';
    }
    return null;
  }

  static String? surname(String? value) =>
      (value == null || value.trim().isEmpty) ? 'შეიყვანეთ გვარი' : null;

  static String? mobile(String? value) {
    final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
    if (digits.isEmpty) return 'შეიყვანეთ მობილურის ნომერი';
    if (!_mobile.hasMatch(digits)) {
      return 'ნომერი უნდა იყოს ფორმატით 5##-##-##-##';
    }
    return null;
  }
}
