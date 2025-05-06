import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
