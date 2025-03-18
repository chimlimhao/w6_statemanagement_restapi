class PostDTO {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostDTO({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    // print('JSON - DTO: $json');
    // assert is used to check if the data is exists and of the correct type
    assert(json['id'] is int, 'id must be an integer');
    assert(json['title'] is String, 'title must be a string');
    assert(json['body'] is String, 'body must be a string');
    assert(json['userId'] is int, 'userId must be an integer');

    return PostDTO(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
