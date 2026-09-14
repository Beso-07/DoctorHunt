class AppValidator {
  // ========================================= Email Validator  ========================================= //

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter valid email';
    }

    return null;
  }

  // =========================================  Password Validator ========================================= //

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // ========================================= Confirm Password ========================================= //  

  static String? confirmPassword({
    required String? value,
    required String password,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // ========================================= Required Validator ========================================= //

  static String? requiredField(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  // ========================================= Name Validator ========================================= //

  static String? validateName(String? value, {String fieldName = 'Name'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < 2) {
      return '$fieldName is too short';
    }

    return null;
  }
}
