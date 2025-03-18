import 'package:flutter/material.dart';

import '../model/post.dart';
import '../repository/post_repository.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _repository;

  AsyncValue<List<Post>>? postValue;

  PostProvider({required PostRepository repository}) : _repository = repository;

  Future<void> fetchPosts() async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      final posts = await _repository.getPosts();
      if (posts.isEmpty) {
        postValue = AsyncValue.empty();
      } else {
        postValue = AsyncValue.success(posts);
      }
    } catch (e) {
      postValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
