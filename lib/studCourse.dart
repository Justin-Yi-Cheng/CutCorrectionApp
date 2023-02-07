import 'Cut.dart';

class studCourse {
  studCourse(
      {required this.teacherProfile,
      required this.teacherCourse,
      required this.teacherName,
      required this.period,
      required this.cutList});

  final String teacherProfile;
  final String teacherCourse;
  final String teacherName;
  final int period;
  List<Cut> cutList;

  String getTeacherProfile() => teacherProfile;
  String getTeacherCourse() => teacherCourse;
  String getTeacherName() => teacherName;
  int getPeriod() => period;
  List<Cut> getCutList() => cutList;
}
