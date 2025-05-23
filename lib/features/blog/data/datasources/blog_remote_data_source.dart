import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_proj/core/error/exceptions.dart';
import 'package:supabase_proj/features/blog/data/models/blog_model.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blog,
  });
  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;
  BlogRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final response = await supabaseClient.from('blogs').insert({
        'title': blog.title,
        'poster_id': blog.posterID,
        'image_url': blog.imageUrl,
        'content': blog.content,
        'topics': blog.topics,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      }).select();

      if (response.isEmpty) {
        throw ServerException('Failed to upload blog: Empty response');
      }

      return BlogModel.fromJson(response[0]);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blog,
  }) async {
    try {
      await supabaseClient.storage
          .from('blog_images')
          .upload('blog_images/${blog.id}', image);
      return supabaseClient.storage
          .from('blog_images')
          .getPublicUrl('blog_images/${blog.id}');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final blogs = await supabaseClient
          .from('blogs')
          .select(
            'id, title, poster_id, image_url, content, topics, created_at, updated_at, profiles(id, name)',
          );

      return blogs
          .map(
            (blog) => BlogModel.fromJson(blog).copyWith(
              posterName: blog['profiles']['name'],
              imageUrl: blog['image_url'] ?? '',
            ),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
