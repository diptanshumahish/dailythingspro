import 'package:dailythingspro/components/common/arrangements/flex_items.dart';
import 'package:dailythingspro/components/common/buttons/offset_full_button.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/main/home.dart';
import 'package:dailythingspro/sqflite/journal/journal_db.dart';
import 'package:dailythingspro/utils/calendar/glyph/return_glyph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class FullJournalView extends ConsumerWidget {
  final int journalId;
  final String title;
  final String time;
  final String mood;
  final String details;
  const FullJournalView(
      {super.key,
      required this.journalId,
      required this.title,
      required this.time,
      required this.mood,
      required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 10,
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.surface,
                title: Text(
                  title,
                  style: textStyles.subheading,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: HomeMain(),
                              type: PageTransitionType.leftToRight),
                          (route) => false);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: DailyThingsColors.tertiaryGray,
                    )),
              ),
              SliverToBoxAdapter(
                child: Animate(
                  effects: const [ScaleEffect()],
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FlexItems(widgetList: [
                      Animate(
                        effects: const [
                          FadeEffect(delay: Duration(milliseconds: 100))
                        ],
                        child: Text(
                          title,
                          style: textStyles.heading,
                        ),
                      ),
                      Animate(
                        effects: const [
                          FadeEffect(delay: Duration(milliseconds: 200))
                        ],
                        child: Text(
                          time,
                          style: textStyles.bodyNavbarActive,
                        ),
                      ),
                      Animate(
                        effects: const [
                          FadeEffect(delay: Duration(milliseconds: 300))
                        ],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: returnGlyphDataMood(mood),
                        ),
                      ),
                      Animate(effects: const [
                        FadeEffect(delay: Duration(milliseconds: 350))
                      ], child: const Divider()),
                      Animate(
                        effects: const [
                          FadeEffect(delay: Duration(milliseconds: 400))
                        ],
                        child: Text(
                          details,
                          style: textStyles.body,
                        ),
                      ),
                      Animate(
                        effects: const [
                          FadeEffect(delay: Duration(milliseconds: 500))
                        ],
                        child: OffsetFullButton(
                          content: "Delete journal",
                          fn: () async {
                            await JournalDB().delete(journalId);
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    child: HomeMain(),
                                    type: PageTransitionType.leftToRight),
                                (route) => false);
                          },
                          icon: Icons.delete,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Animate(
                        effects: const [
                          FadeEffect(delay: Duration(milliseconds: 400))
                        ],
                        child: Text(
                          "Zen thinks deleting a journal is not a good idea, nor editing on it, journals are never perfect, they are just a memory, a reflection of everything that happens ✨",
                          style: textStyles.italic,
                        ),
                      )
                    ], space: 8),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
