import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:supabase_proj/core/error/exceptions.dart';
import 'package:supabase_proj/core/error/failures.dart';
import 'package:supabase_proj/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:supabase_proj/features/blog/data/models/blog_model.dart';
import 'package:supabase_proj/features/blog/domain/entities/blog.dart';
import 'package:supabase_proj/features/blog/domain/repositories/blog_repository.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;
  BlogRepositoryImpl({required this.blogRemoteDataSource});
  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String posterId,
    required String title,
    required String content,
    required List<String> topics,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(), // Generate a unique ID for the blog
        title: title,
        posterID: posterId,
        imageUrl: '',
        content: content,
        topics: topics,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final imageUrl = await blogRemoteDataSource.uploadBlogImage(
        image: image,
        blog: blogModel,
      );
      blogModel = blogModel.copyWith(imageUrl: imageUrl);
      final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);
      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }

    // Placeholder return statement
  }

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      final blogs = await blogRemoteDataSource.getAllBlogs();
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
