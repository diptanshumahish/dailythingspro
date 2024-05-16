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
                ? DailyThingsColors.backgroundColor
                : DailyThingsColors.themeOrange,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isComplete
                    ? Colors.white
                    : DailyThingsColors.backgroundColor),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
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
              Text(
                title,
                style:
                    !isComplete ? TextStyles.headingInvert : TextStyles.heading,
              ),
              Text(
                desc,
                style: isComplete
                    ? TextStyles.bodyNavbarActive
                    : TextStyles.bodyInvert,
              ),
              Text(
                completionTime,
                style: isComplete ? TextStyles.italic : TextStyles.italicInvert,
              ),
              Text(
                isComplete ? "Wohoo task is complete" : "yet to complete task",
                style: isComplete
                    ? TextStyles.bodyNavbarActive
                    : TextStyles.bodyInvert,
              )
            ],
          ),
        ),
      ),
    );
  }
}
