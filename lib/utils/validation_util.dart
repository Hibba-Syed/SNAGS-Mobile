class ValidationUtil {
  static bool isValid(Object? value) {
    return !(value == null || value == false || value.toString().isEmpty);
  }

  static bool isEmailValid(String? value) {
    if (value?.isEmpty ?? true) {
      return false;
    }
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(value!);
  }
}
