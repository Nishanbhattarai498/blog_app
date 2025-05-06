import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });
}
