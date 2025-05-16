part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUploadEvent extends BlogEvent {
  final String imageUrl;
  final String posterId;
  final String title;
  final String content;
  final List<String> topics;

  BlogUploadEvent({
    required this.imageUrl,
    required this.posterId,
    required this.title,
    required this.content,
    required this.topics,
  });
}

final class BlogFetchAllBlog extends BlogEvent {}
