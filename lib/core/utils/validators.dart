class Validators {
  /// Validates an email address
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Validates a phone number (10-digit)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  /// Validates an OTP (6-digit)
  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    final otpRegex = RegExp(r'^\d{6}$');
    if (!otpRegex.hasMatch(value)) {
      return 'Enter a valid 6-digit OTP';
    }
    return null;
  }

  /// Validates a username (only letters and numbers, min 3 characters)
  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,}$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Username must be at least 3 characters and contain only letters, numbers, or underscores';
    }
    return null;
  }

  /// Validates a user ID (alphanumeric, min 6 characters)
  static String? validateUserId(String? value) {
    if (value == null || value.isEmpty) {
      return 'User ID is required';
    }
    final userIdRegex = RegExp(r'^[a-zA-Z0-9]{6,}$');
    if (!userIdRegex.hasMatch(value)) {
      return 'User ID must be at least 6 characters long and contain only letters and numbers';
    }
    return null;
  }
}
