import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/courses_model.dart';
import '../providers/courses_provider.dart';
import '../theme/theme.dart';
import 'course_screen.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // Load courses when the dependencies are available
      Provider.of<CoursesProvider>(context, listen: false).getCourses();
      _isInitialized = true;
    }
  }

  void _editCourse(Course course) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (ctx) => CourseScreen(courseName: course.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<CoursesProvider>(
        builder: (ctx, coursesProvider, child) {
          final courses = coursesProvider.courses;
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder:
                (ctx, index) => Dismissible(
                  key: Key(courses[index].name),
                  child: CourseTile(
                    course: courses[index],
                    onEdit: _editCourse,
                  ),
                ),
          );
        },
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(Course) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(course),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}
