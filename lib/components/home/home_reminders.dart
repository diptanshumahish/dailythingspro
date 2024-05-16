import 'package:dailythingspro/components/home/reminder_item.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/sqflite/daily/daily_db.dart';
import 'package:dailythingspro/sqflite/models/daily_task_entry.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

List<DailyTaskEntry> _taskList = [];

class HomeReminders extends ConsumerStatefulWidget {
  final String id;
  const HomeReminders({super.key, required this.id});

  @override
  ConsumerState<HomeReminders> createState() => _HomeRemindersState();
}

class _HomeRemindersState extends ConsumerState<HomeReminders> {
  fetchTasks(String id) async {
    if (id.isEmpty) return;

    final jb = await DailyDB().fetchIncompleteTasks(id);
    setState(() {
      _taskList = jb;
    });
  }

  @override
  void initState() {
    fetchTasks(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    ref.listen(currentDateProvider, (previous, next) {
      if (previous != null) {
        fetchTasks(previous.id);
      } else {
        fetchTasks(next.id);
      }
    });

    return SliverToBoxAdapter(
      child: Animate(
        effects: const [ScaleEffect(curve: Curves.easeInOut)],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Important reminders",
                    style: textStyles.heading,
                  ),
                  PhosphorIcon(
                    PhosphorIconsRegular.calendarBlank,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 16,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary),
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(5)),
                child: _taskList.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _taskList
                            .map((e) => ReminderItem(
                                completionTime: e.completionTime,
                                desc: e.description))
                            .toList(),
                      )
                    : Center(
                        child: Text(
                          "No reminders for today, set a few from the daily tab✨",
                          style: textStyles.body,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
