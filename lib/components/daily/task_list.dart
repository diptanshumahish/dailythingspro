import 'package:dailythingspro/components/common/arrangements/flex_items.dart';
import 'package:dailythingspro/components/daily/task_container.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/sqflite/daily/daily_db.dart';
import 'package:dailythingspro/sqflite/models/daily_task_entry.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<DailyTaskEntry> _list = [];

class TaskList extends ConsumerStatefulWidget {
  final Function(double data) progress;
  final String selectedDate;
  const TaskList(
      {super.key, required this.selectedDate, required this.progress});

  @override
  ConsumerState<TaskList> createState() => _TaskListState();
}

class _TaskListState extends ConsumerState<TaskList> {
  fetchTasks(String id) async {
    if (id.isEmpty) return;

    final jb = await DailyDB().fetchTasks(id);
    int temp = 0;
    for (var element in jb) {
      if (element.isCompleted == 1) {
        temp++;
      }
    }
    double progres = (temp / jb.length) * 100;
    widget.progress(progres);
    setState(() {
      _list = jb;
    });
  }

  @override
  void initState() {
    fetchTasks(widget.selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    ref.listen(selectedDateProvider, (previous, next) {
      fetchTasks(next.id);
    });
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _list.isNotEmpty
                  ? FlexItems(
                      widgetList: _list
                          .map((e) => GestureDetector(
                                onTap: () {
                                  DailyDB().updateTask(
                                      e.id, e.isCompleted == 0 ? 1 : 0);
                                  ref
                                      .read(selectedDateProvider.notifier)
                                      .updateID(e.dayKey);
                                },
                                child: TaskContainer(
                                    dayKey: e.dayKey,
                                    id: e.id,
                                    isComplete: e.isCompleted == 1,
                                    title: e.title,
                                    desc: e.description,
                                    completionTime: e.completionTime,
                                    category: e.category),
                              ))
                          .toList(),
                      space: 8)
                  : const SizedBox.shrink(),
              _list.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "tap on a task to mark it complete/incomplete, swipe a task to delete it",
                        style: textStyles.italic,
                      ),
                    )
                  : Animate(
                      effects: const [FadeEffect()],
                      child: SizedBox(
                        height: size.height / 4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                DailyThingsImages.noTasks,
                                height: 150,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "No tasks yet for the date",
                                style: textStyles.subheading,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }
}
