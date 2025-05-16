import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_proj/core/usecase/usecase.dart';
import 'package:supabase_proj/features/blog/domain/entities/blog.dart'
    show Blog;
import 'package:supabase_proj/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:supabase_proj/features/blog/domain/usecases/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetAllBlogs _getAllBlogs;
  final UploadBlog _uploadBlog;
  BlogBloc({required GetAllBlogs getAllBlogs, required UploadBlog uploadBlog})
    : _getAllBlogs = getAllBlogs,
      _uploadBlog = uploadBlog,
      super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUploadEvent>(_onBlogUpload);
    on<BlogFetchAllBlog>(_onGetAllBlogs);
  }

  void _onBlogUpload(BlogUploadEvent event, Emitter<BlogState> emit) async {
    final res = await _uploadBlog(
      UploadBlogParams(
        image: File(event.imageUrl),
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        topics: event.topics,
      ),
    );

    res.fold(
      (failure) => emit(BlogFailure(error: failure.message)),
      (blog) => emit(BlogUploadSuccess()),
    );
  }

  void _onGetAllBlogs(BlogFetchAllBlog event, Emitter<BlogState> emit) async {
    final res = await _getAllBlogs(NoParams());

    res.fold(
      (failure) => emit(BlogFailure(error: failure.message)),
      (blogs) => emit(BlogDisplaySuccess(blogs: blogs)),
    );
  }
}
