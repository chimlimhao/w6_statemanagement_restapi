import '../models/courses_model.dart';

abstract class CoursesRepository {
  Future<List<Course>> getCourses();
  Future<void> addScore(Course course, CourseScore score);
}
