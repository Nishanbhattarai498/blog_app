import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });
}
