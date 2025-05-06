import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_proj/core/error/exceptions.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:supabase_proj/features/auth/domain/repositery/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(user as User);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
      );
      return Right(user as User);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
