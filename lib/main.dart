import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'EXERCISE-1/providers/courses_provider.dart';
// import 'EXERCISE-1/repositories/courses_mock_repository.dart';
// import 'EXERCISE-1/screens/courses_list_screen.dart';
import 'EXERCISE-2/screens/post_screen.dart';
import 'EXERCISE-2/repository/mock_post_repository.dart';
import 'EXERCISE-2/provider/posts_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: MockPostRepository()),
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
      // home: CourseListScreen(),
      home: PostScreen(),
    );
  }
}
