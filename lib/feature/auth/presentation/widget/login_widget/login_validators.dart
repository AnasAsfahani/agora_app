class LoginValidators {
  LoginValidators._();

  static String? email(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'Email is required';
    final pattern = RegExp(r'^[A-Za-z0-9.!#$%&''*+/=?^_`{|}~-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)+');
    if (!pattern.hasMatch(input)) return 'Enter a valid email address';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must contain at least 6 characters';
    return null;
  }
}
