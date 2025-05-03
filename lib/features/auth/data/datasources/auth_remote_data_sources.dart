import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_proj/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  /// Calls the login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });

  /// Calls the register endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> signUpwithEmailPassword({
    required String email,
    required String password,
    required String name,
  });
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourcesImpl({required this.supabaseClient});

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException('User not found');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException('e.toString()');
    }
  }

  @override
  Future<String> signUpwithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user == null) {
        throw ServerException('User not found');
      }
      // Optionally, you can also send a confirmation email if needed
      return response.user!.id;
    } catch (e) {
      throw ServerException('e.toString()');
    }
  }
}
