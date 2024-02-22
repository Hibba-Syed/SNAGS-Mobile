part of 'profile_cubit.dart';

class ProfileState {
  final bool isLoading;
  final ProfileRecord? profileRecord;
  const ProfileState({
    this.isLoading = false,
    this.profileRecord,
  });
  ProfileState copyWith({
    bool? isLoading,
    ProfileRecord? profileRecord,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profileRecord: profileRecord ?? this.profileRecord,
    );
  }
}
