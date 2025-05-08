import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/core/usecase/usecase.dart';
import 'package:supabase_proj/core/common/entities/user.dart';
import 'package:supabase_proj/features/auth/domain/repositery/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  const CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.CurrentUser();
  }
}
