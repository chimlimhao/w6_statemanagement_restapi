import 'package:flutter/material.dart';

import '../model/post.dart';
import '../repository/post_repository.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _repository;
  AsyncValue<List<Post>>? postValue;
  PostProvider(this._repository);

  Future<void> fetchPosts() async {
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      final posts = await _repository.fetchPosts();
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

// 1-  Set loading state
// 2-  Fetch the posts
// 3-  Display the posts
// 4-  Handle errors
// 5-  Update the state when the posts are fetched
