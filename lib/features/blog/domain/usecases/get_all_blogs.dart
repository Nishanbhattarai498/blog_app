import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/core/usecase/usecase.dart';
import 'package:supabase_proj/features/blog/domain/entities/blog.dart';
import 'package:supabase_proj/features/blog/domain/repositories/blog_repository.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams> {
  final BlogRepository blogRepository;

  GetAllBlogs({required this.blogRepository});

  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async {
    return await blogRepository.getAllBlogs();
  }
}
