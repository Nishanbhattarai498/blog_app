import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';

abstract interface class Usecase<SuccessType, params> {
  Future<Either<Failure, SuccessType>> call(params params);
}
