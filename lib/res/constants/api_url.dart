class ApiUrl {
  static const String baseUrl = 'https://yafei-pay.zship.co';
  static const String signIn = '$baseUrl/api/login';
  static const String register = '$baseUrl/api/register';
  static const String sendOtp = '$baseUrl/api/reset-password-app';
  static const String resetPassword = '$baseUrl/api/user/change-reset-password';
  static const String appSettings = '$baseUrl/api/app-settings';
  static const String transactions = '$baseUrl/api/v1/transactions';
  static const String wallets = '$baseUrl/api/v1/wallets';
  static const String transferFunds = '$baseUrl/api/v1/transfer-funds';
  static const String fundsRequest = '$baseUrl/api/v1/funds-requests';
}
