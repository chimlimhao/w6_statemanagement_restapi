import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'EXERCISE-2/provider/posts_provider.dart';
import 'EXERCISE-2/repository/implementation/http_posts_repository.dart';
import 'EXERCISE-2/screens/post_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(HttpPostsRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PostScreen(),
    );
  }
}
