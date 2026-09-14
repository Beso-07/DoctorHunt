
class ValidationRegex {
  static RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$');

  static RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  static RegExp emailRegexSimple = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  static RegExp phoneNumberRegex = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');

  static RegExp phoneNumberRegexSimple = RegExp(r'^(\+?[1-9]\d{0,2})?[\s-]?(\(?\d{1,4}\)?[\s-]?)?(\d{1,4}[\s-]?\d{1,4}[\s-]?\d{1,9})$');

  static RegExp numbersOnly = RegExp(r'^[0-9]+$');

  static RegExp emailPhoneRegex = RegExp(r'^(?:\d{11}|\w+@\w+\.\w{2,3})$');
}