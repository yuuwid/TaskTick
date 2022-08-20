import 'package:validators/validators.dart' as validator;

class InputValidator {
  /// [a-z][A-Z]
  bool isText(String input, {int min = 6, int max = 256}) {
    return (validator.isAlpha(input)) && (validator.isLength(input, min, max));
  }

  /// [0-9]
  bool isNumeric(String input, {int min = 6, int max = 256}) {
    return (validator.isNumeric(input)) &&
        (validator.isLength(input, min, max));
  }

  /// [a-z][A-Z][0-1]
  bool isTextNumeric(String input, {int min = 6, int max = 256}) {
    return (validator.isAlphanumeric(input)) &&
        (validator.isLength(input, min, max));
  }

  /// NO FILTER, JUST CHECK THE LENGTH
  bool isTextRich(String input, {int min = 6, int max = 256}) {
    return (validator.isLength(input, min, max));
  }

  /// NO FILTER, JUST CHECK THE LENGTH
  bool isContains(String input, String seed) {
    return (validator.contains(input, seed));
  }
}
