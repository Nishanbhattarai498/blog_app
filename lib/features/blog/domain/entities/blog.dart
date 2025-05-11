class Blog {
  final String id;
  final String title;
  final String posterID;
  final String imageUrl;
  final String content;
  final List<String> topics;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Blog({
    required this.id,
    required this.title,
    required this.posterID,
    required this.imageUrl,
    required this.content,
    required this.topics,
    required this.createdAt,
    required this.updatedAt,
  });
}
