import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dailythingspro/constants/keys.dart';

class UserData {
  final String? name;
  final String? age;
  final String? dailyReminderTime;
  final String? gender;
  final String? martial;
  UserData({
    this.name,
    this.age,
    this.dailyReminderTime,
    this.gender,
    this.martial,
  });

  UserData copyWith({
    String? name,
    String? age,
    String? dailyReminderTime,
    String? gender,
    String? martial,
  }) {
    return UserData(
      name: name ?? this.name,
      age: age ?? this.age,
      dailyReminderTime: dailyReminderTime ?? this.dailyReminderTime,
      gender: gender ?? this.gender,
      martial: martial ?? this.martial,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'dailyReminderTime': dailyReminderTime,
      'gender': gender,
      'martial': martial,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      dailyReminderTime: map['dailyReminderTime'] != null
          ? map['dailyReminderTime'] as String
          : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      martial: map['martial'] != null ? map['martial'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(name: $name, age: $age, dailyReminderTime: $dailyReminderTime, gender: $gender, martial: $martial)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.age == age &&
        other.dailyReminderTime == dailyReminderTime &&
        other.gender == gender &&
        other.martial == martial;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        age.hashCode ^
        dailyReminderTime.hashCode ^
        gender.hashCode ^
        martial.hashCode;
  }
}

class UserNotifier extends StateNotifier<UserData> {
  UserNotifier() : super(UserData()) {
    loadUserDetails();
  }

  Future<void> loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    final loadedData = <String, String>{};

    loadedData[DailyThingsKeys.userNameKey] =
        prefs.getString(DailyThingsKeys.userNameKey)!;
    loadedData[DailyThingsKeys.dailyReminderTimeKey] =
        prefs.getString(DailyThingsKeys.dailyReminderTimeKey)!;
    loadedData[DailyThingsKeys.userAgeKey] =
        prefs.getString(DailyThingsKeys.userAgeKey)!;
    loadedData[DailyThingsKeys.userGenderKey] =
        prefs.getString(DailyThingsKeys.userGenderKey)!;
    loadedData[DailyThingsKeys.userMartialStatus] =
        prefs.getString(DailyThingsKeys.userMartialStatus)!;

    if (loadedData.values.any((value) => value != null)) {
      state = UserData(
          name: loadedData[DailyThingsKeys.userNameKey],
          age: loadedData[DailyThingsKeys.userAgeKey],
          dailyReminderTime: loadedData[DailyThingsKeys.dailyReminderTimeKey],
          gender: loadedData[DailyThingsKeys.userGenderKey],
          martial: loadedData[DailyThingsKeys.userMartialStatus]);
    } else {
      state = UserData(
        name: "",
        age: "",
        dailyReminderTime: "",
        gender: "",
        martial: "",
      );
    }
  }

  Future<void> saveUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(DailyThingsKeys.userNameKey, state.name!);
    await prefs.setString(
        DailyThingsKeys.dailyReminderTimeKey, state.dailyReminderTime!);
    await prefs.setString(DailyThingsKeys.userAgeKey, state.age!);
    await prefs.setString(DailyThingsKeys.userGenderKey, state.gender!);
    await prefs.setString(DailyThingsKeys.userMartialStatus, state.martial!);
  }
}
