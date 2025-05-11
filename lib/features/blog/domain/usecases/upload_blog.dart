import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/core/usecase/usecase.dart';
import 'package:supabase_proj/features/blog/domain/repositories/blog_repository.dart';

import '../entities/blog.dart';

class UploadBlog implements UseCase<Blog, UploadBlogParams> {
  final BlogRepository blogRepository;
  UploadBlog({required this.blogRepository});
  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepository.uploadBlog(
      image: params.image,
      posterId: params.posterId,
      title: params.title,
      content: params.content,
      topics: params.topics,
    );
  }
}

class UploadBlogParams {
  final String title;
  final String posterId;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.title,
    required this.posterId,
    required this.content,
    required this.topics,
    required this.image,
  });
}
