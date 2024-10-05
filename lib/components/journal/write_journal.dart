import 'package:dailythingspro/components/common/buttons/offset_full_button.dart';
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
    TextStyles textStyles = TextStyles(context);

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
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5)),
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Got something to say?",
                                style: textStyles.heading,
                              ),
                              Text(
                                "Let those thoughts come out and lighten you",
                                style: textStyles.subheading,
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
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.6)
                                  .withOpacity(0.2))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              DailyThingsImages.cloud,
                              height: 80,
                            ),
                            Text(
                              "Select a date 😬",
                              style: textStyles.heading,
                            ),
                            Text(
                              "and start penning down your thoughts ✨",
                              style: textStyles.italic,
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
