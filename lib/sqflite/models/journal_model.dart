class JournalEntry {
  final int id;
  final String dayKey;
  final String title;
  final String description;
  final String createdTime;
  final String mood;

  JournalEntry({
    required this.id,
    required this.dayKey,
    required this.title,
    required this.description,
    required this.mood,
    required this.createdTime,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) => JournalEntry(
        id: json['id'] as int,
        dayKey: json['dayKey'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        mood: json['mood'] as String,
        createdTime: DateTime.fromMillisecondsSinceEpoch(json['createdTime'])
            .toIso8601String(),
      );
}
