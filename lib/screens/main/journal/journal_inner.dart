import 'package:dailythingspro/components/journal/j_calendar_view.dart';
import 'package:dailythingspro/components/journal/previous_journals.dart';
import 'package:dailythingspro/components/journal/write_journal.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

String _selectedId = "";

class JournalInner extends ConsumerStatefulWidget {
  const JournalInner({super.key});

  @override
  ConsumerState<JournalInner> createState() => _JournalInnerState();
}

class _JournalInnerState extends ConsumerState<JournalInner> {
  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

    /// set current date as selected date if no date selected
    if (mounted && _selectedId == "") {
      final id = ref.watch(currentDateProvider);
      setState(() {
        _selectedId = id.id;
      });
    }

    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your personal journal",
                    style: textStyles.splashHeading,
                  ),
                  Text(
                    "Write daily, all that's happening",
                    style: textStyles.subheading,
                  )
                ],
              ),
            ),
          ),
          JCalendarView(
            selectedId: (data) => {
              setState(() {
                _selectedId = data;
              })
            },
          ),
          WriteJournal(
            selectedId: _selectedId,
          ),
          PreviousJournals(selectedId: _selectedId),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Column(
                children: [
                  const Icon(
                    Icons.pages,
                    size: 48,
                  ),
                  Text(
                    "Manually Backup your journals",
                    style: textStyles.heading,
                  ),
                  Text(
                    "Zen respects your full privacy, it's upto you how you backup the data, we provide you your backup file, and then you can restore from it whenever you want. Click the link below and learn how to backup files manually with your full control",
                    style: textStyles.body,
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(
                            "https://diptanshumahish.in/dailythings/how-to-backup"));
                      },
                      child: Text(
                        "learn more",
                        style: textStyles.subheading
                            .copyWith(decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
