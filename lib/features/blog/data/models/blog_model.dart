import 'package:supabase_proj/features/blog/domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.title,
    required super.posterID,
    required super.imageUrl,
    required super.content,
    required super.topics,
    required super.createdAt,
    required super.updatedAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      posterID: json['poster_id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      content: json['content'] ?? '',
      topics: List<String>.from(json['topics'] ?? []),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_id': posterID,
      'image_url': imageUrl,
      'content': content,
      'topics': topics,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
