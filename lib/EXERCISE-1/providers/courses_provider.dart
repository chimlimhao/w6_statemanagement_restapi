import 'package:flutter/material.dart';
import '../models/courses_model.dart';
import '../repositories/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {
  final CoursesRepository repository;
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  CoursesProvider({required this.repository});

  Future<List<Course>> getCourses() async {
    _courses = await repository.getCourses();
    notifyListeners();
    return _courses;
  }

  Course? getCourseFor(String courseName) {
    return _courses.firstWhere((course) => course.name == courseName);
  }

  Future<void> addScore(Course course, CourseScore score) async {
    await repository.addScore(course, score);
    notifyListeners();
  }
}
