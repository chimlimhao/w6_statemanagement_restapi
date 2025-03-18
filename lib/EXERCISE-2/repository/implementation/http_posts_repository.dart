import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../dto/post_dto.dart';
import '../../model/post.dart';
import '../post_repository.dart';

class HttpPostsRepository implements PostRepository {
  // The base URL we're fetching from
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      // Step 1: Make the HTTP GET request
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      print('Response: ${response.statusCode}');
      // Step 2: Check if the request was successful
      if (response.statusCode == 200) {
        // print('Response: ${response.body}');
        // Step 3: Parse the JSON response(Converting the JSON response(body) to a list of map(posts))
        final List<dynamic> jsonList = json.decode(response.body);
        print('JSON List: $jsonList');
        return jsonList.map((json) {
          // Step 4: Convert the JSON to a PostDTO
          // print('JSON: $json');
          final dto = PostDTO.fromJson(json);
          // print('DTO: $dto');
          // Step 5: Convert the PostDTO to a Post
          return Post(
            id: dto.id,
            title: dto.title,
            description: dto.body, // map body to description
          );
        }).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
