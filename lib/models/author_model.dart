class AuthorDetails {
  final String content;
  final int id;
  final Author author;
  bool favorite;

  AuthorDetails({
    required this.content,
    required this.id,
    required this.author,
    this.favorite = false,
  });

  factory AuthorDetails.fromMap(Map<String, dynamic> map) => AuthorDetails(
        content: map['content'] as String,
        id: map['id'] as int,
        author: Author.fromMap(map['author'] as Map<String, dynamic>),
      );
}

class Author {
  final String name;
  final String photoUrl;

  const Author({
    required this.name,
    required this.photoUrl,
  });

  factory Author.fromMap(Map<String, dynamic> map) =>
      Author(name: map['name'], photoUrl: map['photoUrl']);
}
