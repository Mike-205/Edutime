class AuthValidators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    // Pattern for Chuka University student email: reg.no@student.chuka.ac.ke
    // Example: ab1.12345.12@student.chuka.ac.ke
    final studentEmailRegex = RegExp(r'^[a-z]+\d*\.\d{5}\.\d{2}@student\.chuka\.ac\.ke$');

    if (!studentEmailRegex.hasMatch(email)) {
      return 'Please use a valid student email';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateFullName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return 'Full name is required';
    }

    if (fullName.trim().length < 2) {
      return 'Full name must be at least 2 characters long';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s\.'-]+$");

    if (!nameRegex.hasMatch(fullName)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validateRegistrationNumber(String? registrationNumber) {
    if (registrationNumber == null || registrationNumber.isEmpty) {
      return 'Registration number is required';
    }

    final regNumRegex = RegExp(r'^[A-Z]+\d*/\d{5}/\d{2}$');

    if (!regNumRegex.hasMatch(registrationNumber)) {
      return 'Please enter a valid registration number (e.g., AB1/12345/12)';
    }

    return null;
  }

  static String? validateVerificationCode(String? code) {
    if (code == null || code.isEmpty) {
      return 'Verification code is required';
    }

    if (code.length != 6) {
      return 'Verification code must be 6 digits';
    }

    final codeRegex = RegExp(r'^[0-9]{6}$');
    if (!codeRegex.hasMatch(code)) {
      return 'Verification code must contain only numbers';
    }

    return null;
  }
}