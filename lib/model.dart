class ResultModel {
  final String courseId;
  final String customCourseId;
  final String courseTitle;
  final double totalCredit;
  final double pointEquivalent;
  final String gradeLetter;
  final double cgpa;

  ResultModel({
    required this.courseId,
    required this.customCourseId,
    required this.courseTitle,
    required this.totalCredit,
    required this.pointEquivalent,
    required this.gradeLetter,
    required this.cgpa,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      courseId: json['courseId'],
      customCourseId: json['customCourseId'],
      courseTitle: json['courseTitle'],
      totalCredit: (json['totalCredit'] as num).toDouble(),
      pointEquivalent: (json['pointEquivalent'] as num).toDouble(),
      gradeLetter: json['gradeLetter'],
      cgpa: (json['cgpa'] as num).toDouble(),
    );
  }
}
