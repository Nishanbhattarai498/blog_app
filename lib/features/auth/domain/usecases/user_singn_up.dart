import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/core/usecase/usecase.dart';
import 'package:supabase_proj/features/auth/domain/repositery/auth_repository.dart';

class UserSingnUp implements Usecase<String, UserSingnUpParams> {
  final AuthRepository authRepository;
  UserSingnUp({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(UserSingnUpParams params) async {
    return await authRepository.signUpwithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSingnUpParams {
  final String name;
  final String email;
  final String password;

  UserSingnUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
