import 'package:dailythingspro/components/journal/j_calendar_view.dart';
import 'package:dailythingspro/components/journal/previous_journals.dart';
import 'package:dailythingspro/components/journal/write_journal.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String _selectedId = "";

class JournalInner extends ConsumerStatefulWidget {
  const JournalInner({super.key});

  @override
  ConsumerState<JournalInner> createState() => _JournalInnerState();
}

class _JournalInnerState extends ConsumerState<JournalInner> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your personal journal",
                    style: TextStyles.splashHeading,
                  ),
                  Text(
                    "Write daily, all that's happening",
                    style: TextStyles.subheading,
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
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
