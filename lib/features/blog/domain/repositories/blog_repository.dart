import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/features/blog/domain/entities/blog.dart'
    show Blog;

abstract interface class BlogRepository {
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String posterId,
    required String title,
    required String content,
    required List<String> topics,
  });
  Future<Either<Failure, List<Blog>>> getAllBlogs();
}
