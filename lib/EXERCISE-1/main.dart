import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/courses_provider.dart';
import 'repositories/courses_mock_repository.dart';
import 'screens/courses_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoursesProvider(repository: CoursesMockRepository()),
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
      home: CourseListScreen(),
    );
  }
}
