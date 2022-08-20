import 'package:formz/formz.dart';
import 'package:tasktick/src/app/utils/input_validator.dart';

enum ValidationError { empty, invalidFormat }

class Npm extends FormzInput<String, ValidationError> with InputValidator {
  const Npm.pure() : super.pure('');
  const Npm.dirty([super.value = ""]) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value?.isNotEmpty == true) {
      return null;
      if ((this.isNumeric(value!.replaceAll('.', ''))) &&
          (this.isContains(value, "."))) {
        return null;
      } else {
        return ValidationError.invalidFormat;
      }
    } else {
      return ValidationError.empty;
    }
  }
}

class Password extends FormzInput<String, ValidationError> with InputValidator {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = ""]) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value?.isNotEmpty == true) {
      return null;
      if (this.isTextRich(value!)) {
        return null;
      } else {
        return ValidationError.invalidFormat;
      }
    } else {
      return ValidationError.empty;
    }
  }
}
