import 'package:dailythingspro/components/common/arrangements/flex_items.dart';
import 'package:dailythingspro/components/journal/full_journal_view.dart';
import 'package:dailythingspro/components/journal/j_container.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/sqflite/journal/journal_db.dart';
import 'package:dailythingspro/sqflite/models/journal_model.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

List<JournalEntry> _journalList = [];

class PreviousJournals extends ConsumerStatefulWidget {
  final String selectedId;
  const PreviousJournals({super.key, required this.selectedId});

  @override
  ConsumerState<PreviousJournals> createState() => _PreviousJournalsState();
}

class _PreviousJournalsState extends ConsumerState<PreviousJournals> {
  fetchJournal(String id) async {
    if (id.isEmpty) return;

    final jb = await JournalDB().fetchJournal(id);
    setState(() {
      _journalList = jb;
    });
  }

  @override
  void initState() {
    fetchJournal(widget.selectedId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    final size = MediaQuery.of(context).size;
    ref.listen(selectedDateProvider, (previous, next) {
      fetchJournal(next.id);
    });

    return SliverToBoxAdapter(
        child: widget.selectedId.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "select a date to view journals",
                      style: textStyles.subheading,
                    ),
                    Text(
                      "more journals = less bad stuff?",
                      style: textStyles.italic,
                    )
                  ],
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: FlexItems(widgetList: [
                  if (_journalList.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Here are the available journals 📖",
                          style: textStyles.subheading,
                        ),
                        Text(
                          "tap on the journals to read them",
                          style: textStyles.body,
                        )
                      ],
                    ),
                  _journalList.isNotEmpty
                      ? AnimatedSwitcher(
                          switchInCurve: Curves.easeInOut,
                          switchOutCurve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) {
                            final animationOffset = animation.drive(Tween(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ));
                            return SlideTransition(
                              position: animationOffset,
                              child: FadeTransition(
                                  opacity: animation, child: child),
                            );
                          },
                          child: Animate(
                            effects: const [FadeEffect()],
                            child: FlexItems(
                                widgetList: _journalList
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                    child: FullJournalView(
                                                        journalId: e.id,
                                                        title: e.title,
                                                        time: DateFormat(
                                                                'hh : mm a')
                                                            .format(DateTime.parse(
                                                                e.createdTime)),
                                                        mood: e.mood,
                                                        details: e.description),
                                                    type: PageTransitionType
                                                        .leftToRight),
                                                (t) => false);
                                          },
                                          child: JContainer(
                                              dayKey: e.dayKey,
                                              mood: e.mood,
                                              title: e.title,
                                              description: e.description,
                                              time: e.createdTime),
                                        ))
                                    .toList(),
                                space: 10),
                          ))
                      : const SizedBox.shrink(),
                  _journalList.isEmpty
                      ? Animate(
                          effects: const [FadeEffect()],
                          child: SizedBox(
                            height: size.height / 3,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MediaQuery(
                                      data: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? MediaQuery.of(context)
                                              .copyWith(invertColors: false)
                                          : MediaQuery.of(context)
                                              .copyWith(invertColors: true),
                                      child: Image.asset(
                                        DailyThingsImages.noData,
                                        height: 150,
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "No entries for the date",
                                    style: textStyles.subheading,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Text(
                    "We intentionally don't allow you to modify your previous journals, made a mistake? let it be- journals are never meant to be perfect 😉",
                    style: textStyles.caption,
                    textAlign: TextAlign.center,
                  )
                ], space: 20),
              ));
  }
}
