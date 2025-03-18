import '../models/courses_model.dart';
import 'courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  @override
  Future<List<Course>> getCourses() async {
    return [Course(name: 'HTML'), Course(name: 'JAVA')];
  }

  @override
  Future<void> addScore(Course course, CourseScore score) async {
    // Implement addScore
    course.addScore(score);
  }
}
