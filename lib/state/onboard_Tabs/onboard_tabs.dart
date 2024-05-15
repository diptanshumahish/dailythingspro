import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardTabSelector {
  final int tab;

  OnboardTabSelector({
    required this.tab,
  });

  OnboardTabSelector copyWith({
    int? tab,
  }) {
    return OnboardTabSelector(
      tab: tab ?? this.tab,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tab': tab,
    };
  }

  factory OnboardTabSelector.fromMap(Map<String, dynamic> map) {
    return OnboardTabSelector(
      tab: map['tab'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardTabSelector.fromJson(String source) =>
      OnboardTabSelector.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OnboardTabSelector(tab: $tab)';

  @override
  bool operator ==(covariant OnboardTabSelector other) {
    if (identical(this, other)) return true;

    return other.tab == tab;
  }

  @override
  int get hashCode => tab.hashCode;
}

class OnboardTabNotifier extends StateNotifier<OnboardTabSelector> {
  OnboardTabNotifier(state) : super(state);
  void updateTab(int tabNo) {
    state = OnboardTabSelector(tab: tabNo);
  }
}
