import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'onboarding_repository.g.dart';

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) =>
    OnboardingRepository();

class OnboardingRepository {
  final _client = Supabase.instance.client;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String usename,
  }) async {
    return _client.auth.signUp(
      password: password,
      email: email,
      data: {'username': usename},
    );
  }

  Future<AuthResponse> verifyCode({
    required String email,
    required String code,
  }) async {
    return _client.auth.verifyOTP(
      email: email,
      token: code,
      type: OtpType.signup,
    );
  }
}
