import 'package:dailythingspro/components/common/buttons/offset_full_button.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/screens/writer/writer_screen.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class WriteJournal extends ConsumerStatefulWidget {
  final String selectedId;
  const WriteJournal({super.key, required this.selectedId});

  @override
  ConsumerState<WriteJournal> createState() => _WriteJournalState();
}

class _WriteJournalState extends ConsumerState<WriteJournal> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Column(
          children: [
            Animate(
              effects: const [ScaleEffect()],
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(DailyThingsImages.write)),
            ),
            widget.selectedId == ref.watch(currentDateProvider).id
                ? Animate(
                    effects: const [FadeEffect()],
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: DailyThingsColors.themeBeige,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Got something to say?",
                                style: TextStyles.headingInvert,
                              ),
                              const Text(
                                "Let those thoughts come out and lighten you",
                                style: TextStyles.subheadingDark,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OffsetFullButton(
                                content: "pen it down",
                                fn: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: WriterScreen(
                                            id: widget.selectedId,
                                          ),
                                          type:
                                              PageTransitionType.bottomToTop));
                                },
                                darkvariant: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.selectedId == ""
                ? Animate(
                    effects: const [
                      ScaleEffect(delay: Duration(milliseconds: 90))
                    ],
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: size.height / 4,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: DailyThingsColors.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: DailyThingsColors.tertiaryGray
                                  .withOpacity(0.2))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              DailyThingsImages.cloud,
                              height: 80,
                            ),
                            const Text(
                              "Select a date 😬",
                              style: TextStyles.heading,
                            ),
                            const Text(
                              "and start penning down your thoughts ✨",
                              style: TextStyles.italic,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
