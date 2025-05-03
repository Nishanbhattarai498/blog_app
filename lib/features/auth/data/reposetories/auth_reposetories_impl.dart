import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/exceptions.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:supabase_proj/features/auth/domain/repositery/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpwithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.signUpwithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
