part of 'auth_cubit.dart';

class AuthState {
  final bool isLoading;

  const AuthState({
    this.isLoading = false,
  });
  AuthState copyWith({
    bool? isLoading,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
