String? validateEmailOrPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter valid email or phone number';
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');

  if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
    return 'Enter valid email or phone number';
  }
  return null;
}

String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter First Name';
  }
  return null;
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter Last Name';
  }
  return null;
}

String? validateOptionalPhone(String? value) {
  if (value != null && value.isNotEmpty) {}
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 8 characters long';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!RegExp(r'\d').hasMatch(value)) {
    return 'Password must contain at least one number';
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }

  return null;
}


String? validateOTP(String? otp) {
  // Check if the OTP is empty
  if (otp!.isEmpty) {
    return 'OTP cannot be empty';
  }

  // Check if the OTP is numeric and has a specific length (e.g., 6 digits)
  if (otp.length != 6 || !RegExp(r'^\d+$').hasMatch(otp)) {
    return 'Enter a valid 6-digit OTP';
  }

  // Return null if there are no validation errors
  return null;
}
