import 'package:dailythingspro/state/Tabs/tabselector.model.dart';
import 'package:dailythingspro/state/app_start/app_start_date.dart';
import 'package:dailythingspro/state/current/current_date.dart';
import 'package:dailythingspro/state/journal/selected_date.dart';
import 'package:dailythingspro/state/onboard_Tabs/onboard_tabs.dart';
import 'package:dailythingspro/state/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardTabsProvider =
    StateNotifierProvider<OnboardTabNotifier, OnboardTabSelector>(
        (ref) => OnboardTabNotifier(OnboardTabSelector(tab: 0)));
final tabsProvider = StateNotifierProvider<TabNotifier, TabSelector>(
    (ref) => TabNotifier(TabSelector(tab: 0)));

final userProvider =
    StateNotifierProvider<UserNotifier, UserData>((ref) => UserNotifier());

final selectedDateProvider =
    StateNotifierProvider<SelectedIDNotifier, SelectedId>(
        (ref) => SelectedIDNotifier(SelectedId(id: "")));

final currentDateProvider =
    StateNotifierProvider<CurrentDateNotifier, CurrentDate>(
        (ref) => CurrentDateNotifier());
final appStartDateProvider =
    StateNotifierProvider<AppStartDateNotifier, AppStartDate>(
        (ref) => AppStartDateNotifier());
