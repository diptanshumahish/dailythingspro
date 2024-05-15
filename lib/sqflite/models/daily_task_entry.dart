class DailyTaskEntry {
  final int id;
  final String dayKey;
  final String title;
  final String description;
  final DateTime createdTime;
  final String category;
  final int isCompleted;
  final String completionTime;

  DailyTaskEntry(
      {required this.id,
      required this.dayKey,
      required this.title,
      required this.description,
      required this.category,
      required this.createdTime,
      required this.completionTime,
      required this.isCompleted});

  factory DailyTaskEntry.fromJson(Map<String, dynamic> json) => DailyTaskEntry(
      id: json['id'] as int,
      dayKey: json['dayKey'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      createdTime: DateTime.fromMillisecondsSinceEpoch(json['createdTime']),
      completionTime: json['completionTime'] as String,
      isCompleted: json['isCompleted'] as int);
}
