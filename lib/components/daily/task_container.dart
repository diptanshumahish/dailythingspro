import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/sqflite/daily/daily_db.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskContainer extends ConsumerWidget {
  final int id;
  final bool isComplete;
  final String title;
  final String dayKey;
  final String desc;
  final String completionTime;
  final String category;
  const TaskContainer(
      {super.key,
      required this.isComplete,
      required this.id,
      required this.title,
      required this.dayKey,
      required this.desc,
      required this.completionTime,
      required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    final size = MediaQuery.of(context).size;
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) async {
            await DailyDB().delete(id);
            ref.read(selectedDateProvider.notifier).updateID(dayKey);
          },
          label: "Delete",
          icon: Icons.delete,
          backgroundColor: const Color.fromARGB(255, 214, 143, 143),
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.all(8),
        )
      ]),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: isComplete
                ? Theme.of(context).colorScheme.surface
                : DailyThingsColors.themeOrange,
            borderRadius: BorderRadius.circular(8),
            border: Theme.of(context).brightness == Brightness.dark
                ? Border.all(
                    color: isComplete
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.6)
                        : Theme.of(context).colorScheme.background)
                : Border.all(
                    color: isComplete
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.6)
                        : Theme.of(context).colorScheme.primary),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: isComplete ? const Offset(1, 1) : const Offset(3, 3),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme.of(context).brightness == Brightness.dark
                  ? Text(
                      title,
                      style: !isComplete
                          ? textStyles.headingInvert
                          : textStyles.heading,
                    )
                  : Text(
                      title,
                      style:
                          !isComplete ? textStyles.heading : textStyles.heading,
                    ),
              Text(
                desc,
                style: Theme.of(context).brightness == Brightness.dark
                    ? isComplete
                        ? textStyles.bodyNavbarActive
                        : textStyles.bodyInvert
                    : isComplete
                        ? textStyles.bodyNavbarActive
                        : textStyles.body,
              ),
              Text(
                completionTime,
                style: isComplete ? textStyles.italic : textStyles.italicInvert,
              ),
              Text(
                isComplete ? "Wohoo task is complete" : "yet to complete task",
                style: Theme.of(context).brightness == Brightness.dark
                    ? isComplete
                        ? textStyles.bodyNavbarActive
                        : textStyles.bodyInvert
                    : isComplete
                        ? textStyles.bodyNavbarActive
                        : textStyles.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
